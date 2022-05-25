//
//  Stop.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

struct Stop: Codable, Identifiable {
    var id: Int { stopId }
    var disruptionIds: [Int] = []
    let stopSuburb: String
    let stopName: String
    let stopId: Int
    let routeType: Int
    let stopLatitude: Double
    let stopLongitude: Double
    let stopSequence: Int
}
