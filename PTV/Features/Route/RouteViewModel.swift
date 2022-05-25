//
//  RouteViewModel.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation
import Combine
import SwiftUI

extension RouteScene {
    
    class RouteViewModel: ObservableObject, PTVViewModelType {
        
        @Published var showError = false
        @Published var showProgressOverlay = false
        @Published var state = ViewModelState.loading
        @Published var stops: [Stop] = []
        @Published var directions: [Direction] = []
        
        var endpoint: EndpointType
        typealias EndpointType = StopsOnRoute
        
        var cancellables: [AnyCancellable] = []
        
        let route: Route
        
        var alertErrorType: AlertErrorType? {
            didSet {
                showError = true
            }
        }
        
        init(route: Route) {
            self.route = route
            self.endpoint = EndpointType(route: route)
            fetch(Directions(route: route)) { value in
                self.directions = value.directions
            }
        }
        
        func receive(value: EndpointType.ResultType) {
            self.stops = value.stops
        }
    }
    
}
