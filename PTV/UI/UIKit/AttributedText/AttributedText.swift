//
//  AttributedText.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

// https://github.com/gonzalezreal/AttributedText/releases/tag/1.0.0-beta.2

import SwiftUI

/// A view that displays styled attributed text.
public struct AttributedText: View {
    
    @StateObject private var textSizeViewModel = TextSizeViewModel()
    @Environment(\.colorScheme) var colorScheme

    private let type: AttribubtedTextType
    private let onOpenLink: ((URL) -> Void)?
    
    private let textColor: UIColor?

    init(_ type: AttribubtedTextType, textColor: UIColor? = nil, onOpenLink: ((URL) -> Void)? = nil) {
        self.type = type
        self.textColor = textColor
        self.onOpenLink = onOpenLink
    }

    init(type: () -> AttribubtedTextType, textColor: UIColor? = nil, onOpenLink: ((URL) -> Void)? = nil) {
        self.init(type(), onOpenLink: onOpenLink)
    }

    public var body: some View {
        GeometryReader { geometry in
            AttributedTextImpl(
                type: type,
                maxLayoutWidth: geometry.maxWidth,
                textSizeViewModel: textSizeViewModel,
                onOpenLink: onOpenLink,
                colorScheme: colorScheme,
                textColor: textColor
            )
            .accentColor(Color.accentColor)
        }
        .frame(
            idealWidth: textSizeViewModel.textSize?.width,
            idealHeight: textSizeViewModel.textSize?.height
        )
        .fixedSize(horizontal: false, vertical: true)
    }
}

extension GeometryProxy {
    fileprivate var maxWidth: CGFloat {
        size.width - safeAreaInsets.leading - safeAreaInsets.trailing
    }
}
