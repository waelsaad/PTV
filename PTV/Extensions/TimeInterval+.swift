//
//  TimeInterval+.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

private let kSecondsInMinute: TimeInterval = 60
private let kSecondsInHour = kSecondsInMinute * 60

extension TimeInterval {
    var string: String {
        var time = self
        var str = ""
        let hours = floor(time / kSecondsInHour)
        
        if hours >= 1 {
            time -= hours * kSecondsInHour
            str += "\(Int(hours)) hours"
        }
        
        let minutes = floor(time / kSecondsInMinute)
        if minutes >= 1 {
            time -= minutes * kSecondsInMinute
            if hours >= 1 {
                str += ", "
            }
            str += "\(Int(minutes)) minutes"
        }
        
        let seconds = floor(time)
        if seconds > 0 {
            if str.count > 0 {
                str += ", "
            }
            str += "\(Int(time)) seconds"
        }
        
        return str
    }
}
