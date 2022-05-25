//
//  PTV+API.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

struct RouteTypes: Endpoint {
    typealias ResultType = RouteTypesResponse
    let path = "route_types"
    let query = [String: String]()
}

struct Routes: Endpoint {
    typealias ResultType = RoutesResponse
    let path: String
    let query: [String: String]
    
    init(routeTypes: [RouteType]) {
        var query = [String: String]()
        query["route_types"] = routeTypes.map { "\($0.routeType)" }.joined(separator: ",")
        self.query = query
        self.path = "routes"
    }
}

struct StopsOnRoute: Endpoint {
    typealias ResultType = StopsResponse
    let path: String
    let query: [String: String] = [:]
    
    init(route: Route) {
        path = "stops/route/\(route.routeId)/route_type/\(route.routeType)"
    }
}

struct Stops: Endpoint {
    typealias ResultType = StopsResponse
    let path: String
    let query: [String: String] = [:]
    
    init(latitude: Double, longitude: Double) {
        path = "stops/location/\(latitude),\(longitude)"
    }
}

struct DeparturesAtStop: Endpoint {
    typealias ResultType = DeparturesResponse
    let path: String
    let query: [String: String] = [:]
    
    init(stop: Stop) {
        path = "departures/route_type/\(stop.routeType)/stop/\(stop.stopId)"
    }
    
    init(stop: Stop, route: Route) {
        path = "departures/route_type/\(stop.routeType)/stop/\(stop.stopId)/route/\(route.routeId)"
    }
}

struct Directions: Endpoint {
    typealias ResultType = DirectionsResponse
    let path: String
    let query: [String: String] = [:]
    
    init(route: Route) {
        path = "directions/route/\(route.routeId)"
    }
}
