//
//  ViewModelState.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

enum ViewModelState: Equatable {
    case loading
    case loaded
    case error(AppError)

    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.error, .error):
            return true
        case (.loaded, .loaded):
            return true
        default:
            return false
        }
    }

}
