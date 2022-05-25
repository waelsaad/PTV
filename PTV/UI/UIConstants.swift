//
//  UIConstants.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import UIKit

enum UIConstants {

    enum Padding {
        static let buttonTextImageSpace = 10.0
    }

    enum CornerRadius {
        static let infoBox = 5.0
        static let container = 10.0
    }

    enum ImageSize {
        static let verySmall = 32.0
        enum Logo {
            static let large = 33.0
            static let small = 20.0
        }
    }

    enum Spacing {
        static let zero = 0.0
        static let extraSmall = 5.0
        static let small = 10.0
        static let medium = 15.0
        static let large = 20.0
        static let extraLarge = 30.0
        static let xxLarge = 40.0
    }

    enum CircularSpinner {
        static let large = 60.0
        static let medium = 40.0
        static let small = 17.0
    }

    enum Border {
        static let scannerBoxWidth = 2.0
        static let fine = 0.5
    }

    enum ProgressBar {
        static let height = 4.0
    }

    enum Overlay {
        static let minSize = 150.0
        static let opacity = 0.95
        static let cornerRadius = 25.0
    }

}
