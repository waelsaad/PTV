//
//  Date+.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

extension Date {

    func format(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style = .none) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }

}
