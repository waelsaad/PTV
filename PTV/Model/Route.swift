//
//  Route.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

struct Route: Codable, Identifiable {
    var id: Int { routeId }
    let routeServiceStatus: RouteServiceStatus
    let routeType: Int
    let routeId: Int
    let routeName: String
    let routeNumber: String
    let routeGtfsId: String
}
