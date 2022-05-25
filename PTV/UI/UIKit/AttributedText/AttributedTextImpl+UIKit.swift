//
//  AttributedTextImpl+UIKit.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI
import SwiftyMarkdown

extension AttributedTextImpl: UIViewRepresentable {
    func makeUIView(context: Context) -> TextView {
        let uiView = TextView()

        uiView.backgroundColor = .clear
        uiView.textContainerInset = .zero
        uiView.isEditable = false
        uiView.isScrollEnabled = false
        uiView.textContainer.lineFragmentPadding = 0
        uiView.delegate = context.coordinator

        return uiView
    }

    private func getTextColour(for colourScheme: ColorScheme) -> UIColor {
        colorScheme == .dark ? .white : .black
    }

    func updateUIView(_ uiView: TextView, context: Context) {
        DispatchQueue.main.async {
            switch type {
            case let .markdown(text, centered, textStyle):
                let swiftyMarkdown = SwiftyMarkdown(string: text)
                swiftyMarkdown.h3.fontSize += 8
                swiftyMarkdown.h3.fontStyle = .bold
                swiftyMarkdown.bullet = "•"
                var attributedString = swiftyMarkdown.attributedString()
                if centered {
                    attributedString = attributedString.alignCentre()
                }
                let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)

                mutableAttributedString.replaceFont(
                    with: UIFont.preferredFont(forTextStyle: textStyle),
                    overrideSize: true,
                    overrideColour: textColor ?? getTextColour(for: colorScheme)
                )

                uiView.attributedText = mutableAttributedString
            case .html(let text):
                if let attributedString = try? NSMutableAttributedString(
                    data: Data(text.utf8),
                    options: [.documentType: NSAttributedString.DocumentType.html],
                    documentAttributes: nil
                ) {

                    attributedString.replaceFont(
                        with: UIFont.preferredFont(forTextStyle: .body),
                        overrideSize: true,
                        overrideColour: textColor ?? getTextColour(for: colorScheme)
                    )
                    
                    uiView.attributedText = attributedString
                } else {
                    uiView.attributedText = NSAttributedString(string: text)
                }
            }
            uiView.maxLayoutWidth = maxLayoutWidth

            uiView.textContainer.maximumNumberOfLines = context.environment.lineLimit ?? 0
            uiView.textContainer.lineBreakMode = NSLineBreakMode(
                truncationMode: context.environment.truncationMode
            )

            context.coordinator.openLink = onOpenLink

            textSizeViewModel.didUpdateTextView(uiView)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

extension AttributedTextImpl {
    final class TextView: UITextView {
        var maxLayoutWidth: CGFloat = 0 {
            didSet {
                guard maxLayoutWidth != oldValue else { return }
                invalidateIntrinsicContentSize()
            }
        }

        override var intrinsicContentSize: CGSize {
            guard maxLayoutWidth > 0 else {
                return super.intrinsicContentSize
            }

            return sizeThatFits(CGSize(width: maxLayoutWidth, height: .greatestFiniteMagnitude))
        }
    }

    final class Coordinator: NSObject, UITextViewDelegate {
        var openLink: ((URL) -> Void)?

        func textView(_: UITextView, shouldInteractWith URL: URL, in _: NSRange, interaction: UITextItemInteraction) -> Bool {
            guard case .invokeDefaultAction = interaction else {
                return false
            }

            if let openLink = self.openLink {
                openLink(URL)
            } else {
                URL.openIt()
            }
            return false
        }

        func textView(
            _: UITextView,
            shouldInteractWith _: NSTextAttachment,
            in _: NSRange,
            interaction _: UITextItemInteraction
        ) -> Bool {
            // Disable text attachment interactions
            false
        }
    }
}
