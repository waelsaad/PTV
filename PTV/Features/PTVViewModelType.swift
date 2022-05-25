//
//  PTVPlannerViewModelType.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation
import Combine

protocol PTVViewModelType: ObservableObject {
    associatedtype EndpointType: Endpoint
    var endpoint: EndpointType { get }
    var showError: Bool { get set }
    var showProgressOverlay: Bool { get set }
    var cancellables: [AnyCancellable] { get set }
    var state: ViewModelState { get set }
    var alertErrorType: AlertErrorType? { get set }
    func receive(value: EndpointType.ResultType)
    func fetch()
}

extension PTVViewModelType {
    
    func fetch() {
        fetch(endpoint, self.receive)
    }

    func fetch<E: Endpoint>(_ endpoint: E, _ callback: @escaping (E.ResultType) -> Void) {
        state = ViewModelState.loading
        let ptv: API = .access
        ptv.request(endpoint: endpoint)
        .receive(on: RunLoop.main)
        .sink { [weak self] completion in
            self?.showProgressOverlay = false
            self?.handleErrors(completion: completion)
        } receiveValue: { [weak self] response in
            self?.state = .loaded
            callback(response)
        }
        .store(in: &cancellables)
    }
    
    private func handleErrors(completion: Subscribers.Completion<AppError>) {
        if case .failure(let error) = completion {
            switch error {
            case .noInternet(let localizedError):
                state = .error(.noInternet(localizedError))
                alertErrorType = .noInternet(localizedError)
            case .sessionExpired(let localizedError):
                state = .error(.sessionExpired(localizedError))
                alertErrorType = .sessionExpired(error.localizedDescription)
            case .sessionFailed(let localizedError):
                state = .error(.sessionFailed(localizedError))
                alertErrorType = .sessionFailed(localizedError)
            default:
                state = .error(error)
                alertErrorType = .serverError(error.localizedDescription)
            }
        }
    }
}
