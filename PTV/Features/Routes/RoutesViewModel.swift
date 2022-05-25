//
//  RoutesViewModel.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation
import Combine
import SwiftUI

extension RoutesScene {
    
    class RoutesViewModel: ObservableObject, PTVViewModelType {
        
        @Published var showError = false
        @Published var showProgressOverlay = false
        @Published var state = ViewModelState.loading
        @Published var routes: [Route] = []
        
        var endpoint: EndpointType
        
        typealias EndpointType = Routes
        
        var cancellables: [AnyCancellable] = []
        
        var selectedRoute: RouteType?
        
        var alertErrorType: AlertErrorType? {
            didSet {
                showError = true
            }
        }
        
        init(routeTypes: [RouteType], selectedRoute: RouteType) {
            self.selectedRoute = selectedRoute
            self.endpoint = EndpointType(routeTypes: routeTypes)
        }
        
        func receive(value: EndpointType.ResultType) {
            self.routes = value.routes
        }
        
    }
}
