//
//  RouteType.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

struct RouteType: Codable, Identifiable {
    var id: Int { routeType }
    let routeTypeName: String
    let routeType: Int
}

extension RouteType {
    enum RideType: Int, Codable {
        case train
        case tram
        case bus
        case vLine
    }

    var rideType: RideType? {
        RideType(rawValue: routeType)
    }
    
    var imageName: String {
        self.routeTypeName.lowercased()
    }
}
