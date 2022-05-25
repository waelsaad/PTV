//
//  PTV.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation
import CommonCrypto
import Combine

protocol DataAdapter {
    func request<T: Endpoint>(endpoint: T) -> AnyPublisher<T.ResultType, AppError>
}

class API: ObservableObject, DataAdapter {
    
    static let apiVersion = "3"
    static let baseURL = "https://timetableapi.ptv.vic.gov.au"
    
    var cancellables: [AnyCancellable] = []
    
    static let access: API = { API(token: AccessToken( key: AppKeys.key, developerID: AppKeys.developerID)) }()
    
    struct AccessToken {
        let key: String
        let developerID: Int
    }
    
    let token: AccessToken
    let decoder: JSONDecoder
    
    init(token: AccessToken) {
        self.token = token
        self.decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    private func signedUrl<T: Endpoint>(route: T) -> URL? {
        guard
            let url = route.url(token.developerID)
        else { return nil }
        let signature = url.hmac(key: token.key)
        guard
            let url = URL(string: String(format: "%@%@&signature=%@", API.baseURL, url, signature))
        else { return nil }
        return url
    }
    
    func request<T: Endpoint>(endpoint: T) -> AnyPublisher<T.ResultType, AppError> {
        guard
            let url = signedUrl(route: endpoint)
        else { return AnyPublisher(Empty()) }
        
        // swiftlint:disable trailing_closure
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap {
                try self.decoder.decode(T.ResultType.self, from: $0.data)
            }
            .mapError({ error in
                let localizedError = error.localizedDescription
                switch error {
                case is Swift.DecodingError:
                    return .decodingFailed(localizedError)
                case is URLError:
                    return .sessionFailed(localizedError)
                default:
                    return AppError.logged(.other(code: .httpBadRequest, error: localizedError))
                    // return AppError.logged(.other(code: .getURLError), description: "Get url error: " + urlError.localizedDescription)
                }
            })
            .eraseToAnyPublisher()
    }
}
