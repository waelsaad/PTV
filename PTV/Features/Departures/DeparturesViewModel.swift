//
//  DeparturesViewModel.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation
import Combine
import SwiftUI

extension DeparturesScene {
    
    class DeparturesViewModel: ObservableObject, PTVViewModelType {
        
        @Published var showError = false
        @Published var showProgressOverlay = false
        @Published var state = ViewModelState.loading
        @Published var departures: [Departure] = []
        
        typealias EndpointType = DeparturesAtStop

        struct DepartureInfo: Identifiable {
            var id: Date {
                departure.scheduledDepartureUtc
            }
            let departure: Departure
            let time: String
            var platform: String {
                if let platform = departure.platformNumber {
                    return Content.platform.stringValue + " \(platform)"
                }
                return ""
            }
        }

        let formatter: DateFormatter
        var endpoint: EndpointType
        var cancellables: [AnyCancellable] = []
        let stop: Stop
        let route: Route
        let directions: [Direction]
        let now: Date
        let filterOld: Bool
        
        var alertErrorType: AlertErrorType? {
            didSet {
                showError = true
            }
        }
        
        var departuresSoon: [DepartureInfo] {
            departures.compactMap {
                let distance = ($0.estimatedDepartureUtc ?? $0.scheduledDepartureUtc).distance(to: now)
                guard !filterOld || distance > 0 else {
                    return nil
                }
                
                return DepartureInfo(departure: $0, time: distance.string)
            }
        }

        init(stop: Stop, route: Route, directions: [Direction], now: Date = Date(), filterOld: Bool = true) {
            self.stop = stop
            self.route = route
            self.directions = directions
            self.now = now
            self.filterOld = filterOld
            self.endpoint = EndpointType(stop: stop, route: route)
            self.formatter = DateFormatter()
        }
        
        func receive(value: EndpointType.ResultType) {
            self.departures = value.departures.sorted { $0.id > $1.id }
        }
    }
}
