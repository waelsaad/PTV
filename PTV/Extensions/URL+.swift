//
//  URL+.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import UIKit
import SwiftUI

extension URL {
    
    func openIt() {
        if UIApplication.shared.canOpenURL(self) {
            UIApplication.shared.open(self, options: [:], completionHandler: nil)
        } else {
            log("Can't Open URL on Simulator", .info)
        }
    }
}
