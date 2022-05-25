//
//  AttributedText+Initialisers.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

enum AttribubtedTextType {
    case markdown(text: String, centered: Bool = false, textStyle: UIFont.TextStyle = .body)
    case html(text: String)
}
