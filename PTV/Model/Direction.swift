//
//  Direction.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

struct Direction: Codable, Identifiable {
    var id: Int { directionId }
    let routeDirectionDescription: String
    let directionId: Int
    let directionName: String
    let routeId: Int
    let routeType: Int
}
