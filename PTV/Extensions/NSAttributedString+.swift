//
//  NSAttributedString+.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import UIKit

extension NSMutableAttributedString {

    func replaceFont(with font: UIFont, overrideSize: Bool = false, overrideColour: UIColor? = nil) {
        beginEditing()
        self.enumerateAttribute(.font, in: NSRange(location: 0, length: self.length)) { value, range, _ in
            if let fValue = value as? UIFont {
                // swiftlint:disable:next force_unwrapping
                let ufd = fValue.fontDescriptor.withFamily(font.familyName).withSymbolicTraits(fValue.fontDescriptor.symbolicTraits)!
                let newSize: CGFloat
                if overrideSize {
                    newSize = font.pointSize
                } else {
                    newSize = fValue.pointSize
                }
                let newFont = UIFont(descriptor: ufd, size: newSize)
                removeAttribute(.font, range: range)
                addAttribute(.font, value: newFont, range: range)
                if let overrideColour = overrideColour {
                    addAttribute(.foregroundColor, value: overrideColour, range: range)
                }
            }
        }
        endEditing()
    }

    func centreAligned() {
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .center
        self.addAttribute(kCTParagraphStyleAttributeName as NSAttributedString.Key, value: paraStyle, range: NSRange(location: 0, length: self.string.count))
    }

}

extension NSAttributedString {

    func alignCentre() -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.centreAligned()
        return mutableAttributedString
    }
}
