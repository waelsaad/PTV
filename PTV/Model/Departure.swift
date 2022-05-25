//
//  Departure.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

struct Departure: Codable, Identifiable {
    var id: Date { scheduledDepartureUtc }
    let stopId: Int
    let routeId: Int
    let runId: Int
    let directionId: Int
    var disruptionIds: [Int] = []
    let scheduledDepartureUtc: Date
    let estimatedDepartureUtc: Date?
    let atPlatform: Bool
    let platformNumber: String?
    let flags: String?
    let departureSequence: Int
}
