//
//  RouteTypesViewModel.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation
import Combine
import SwiftUI

extension RouteTypesScene {
    
    class RouteTypesViewModel: ObservableObject, PTVViewModelType {
        
        @Published var showError = false
        @Published var showProgressOverlay = false
        @Published var state = ViewModelState.loading
        @Published var routeTypes: [RouteType] = []
        
        let endpoint = EndpointType()
        typealias EndpointType = RouteTypes

        var todayDate: String {
            Date().format(dateStyle: .full)
        }
        
        var alertErrorType: AlertErrorType? {
            didSet {
                showError = true
            }
        }
        
        var cancellables: [AnyCancellable] = []
        
        init() {

        }
        
        func receive(value: EndpointType.ResultType) {
            self.routeTypes = value.routeTypes.dropLast()
        }
    }
}
