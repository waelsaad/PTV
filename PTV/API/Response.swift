//
//  Response.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

struct RouteTypesResponse: ResponseType {
    let routeTypes: [RouteType]
}

struct RoutesResponse: ResponseType {
    let routes: [Route]
}

struct StopsResponse: ResponseType {
    let stops: [Stop]
}

struct DeparturesResponse: ResponseType {
    let departures: [Departure]
}

struct DirectionsResponse: ResponseType {
    let directions: [Direction]
}
