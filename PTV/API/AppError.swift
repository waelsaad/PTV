//
//  AppError.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct BadHTTPRequestResponse: Decodable {

    struct MoreInfo: Decodable {
        let name: String
        let description: String
    }

    let status: String?
    let path: String?
    let trackingId: String?
    let description: String?

    let moreInfo: [MoreInfo]
}

struct BadHTTPRequestResponse2: Decodable {
    let status: String?
    let moreInfo: String?
    let description: String?
}

enum AppError: Error {
    
    case decodingFailed(String)
    case noInternet(String)
    case sessionExpired(String)
    case notFound(String)
    case sessionFailed(String)
    case other(code: Code, error: String)
    
    enum Code: Int {
        
        // MARK: App - Not Used
        case noRoutsFound = 1_001

        // MARK: API - Not Used
        case unknown = 0
        case urlRequestError = 2_000
        case httpBadRequest = 3_001
        case httpUnauthorized = 3_002
        case serverError = 3_006
        case getURLError = 3_007
    }

    private var errorDescription: String {
        switch self {
        case .noInternet:
            return "No internet connection."
        case .sessionExpired:
            return "Session Expired."
        case .notFound:
            return "Not found"
        case .other(let code, _):
            return "Other error, code: \(code)"
        default:
            return "Other error"
        }
    }
    
    static func logged(_ appError: AppError, description: String? = "") -> AppError {
        var logMessage =
            "Error type: \(appError.errorDescription)"
        if let description = description {
            logMessage += "\nDescription: \(description)"
        }
        log(logMessage, .error)
        return appError
    }
    
    var code: Int {
        switch self {
        case .noInternet: return 10
        case .sessionExpired: return 20
        case .notFound: return 30
        case .other(let code, _): return code.rawValue
        default: return -1
        }
    }
}
