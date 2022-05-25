//
//  Endpoint.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

protocol ResponseType: Codable { }

protocol Endpoint {
    associatedtype ResultType: ResponseType
    var path: String { get }
    var query: [String: String] { get }
    func url(_ userId: Int) -> String?
}

extension Endpoint {
    func url(_ userId: Int) -> String? {
        var components = URLComponents()
        components.path = "/v\(API.apiVersion)/\(path)"
        components.queryItems = query.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        components.queryItems?.append(URLQueryItem(name: "devid", value: "\(userId)"))
        
        return components.string
    }
}
