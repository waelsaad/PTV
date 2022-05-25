//
//  ViewModelState.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI
import Foundation

enum AlertErrorType {
    case noInternet(String)
    case sessionFailed(String)
    case sessionExpired(String)
    case serverError(String)
    
    var title: LocalizedStringKey {
        switch self {
        case .noInternet:
            return GlobalContent.noInternetTitle
        case .sessionFailed:
            return GlobalContent.sessionFailedTitle
        case .sessionExpired:
            return GlobalContent.sessionExpiredTitle
        case .serverError:
            return GlobalContent.serverErrorTitle
        }
    }
    
    // Display server errors
    var serverError: String {
        switch self {
        case .noInternet(let error):
            return error
        case .sessionFailed(let error):
            return error
        case .sessionExpired(let error):
            return error
        case .serverError(let error):
            return error
        }
    }
    
    // Display specific error messages
    var message: String {
        switch self {
        case .noInternet:
            return GlobalContent.noInternetMessage.stringValue
        case .sessionFailed:
            return GlobalContent.sessionFailedMessage.stringValue
        case .sessionExpired:
            return GlobalContent.sessionExpiredMessage.stringValue
        case .serverError:
            return GlobalContent.serverErrorMessage.stringValue
        }
    }
}
