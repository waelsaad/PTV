//
//  LocalizedStringKey+.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

// swiftlint:disable force_unwrapping nslocalizedstring_key

import SwiftUI

extension LocalizedStringKey {
    
    var stringKey: String {
        let description = "\(self)"

        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }

        return components[1][0]
    }

    var stringValue: String {
        .localizedString(for: self.stringKey, locale: .current)
    }

}

extension String {
    static func localizedString(for key: String, locale: Locale = .current) -> String {

        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: .empty)

        return localizedString
    }

    var localized: String { NSLocalizedString(self, comment: .empty) }
}
