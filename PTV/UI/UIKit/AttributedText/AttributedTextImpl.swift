//
//  AttributedTextImpl.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct AttributedTextImpl {
    var type: AttribubtedTextType
    var maxLayoutWidth: CGFloat
    var textSizeViewModel: TextSizeViewModel
    var onOpenLink: ((URL) -> Void)?
    var colorScheme: ColorScheme
    var textColor: UIColor?
}
