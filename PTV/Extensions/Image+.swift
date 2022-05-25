//
//  Image+.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

extension Image {
    init(appImage: AppImage) {
        self.init(appImage.rawValue)
    }
}

extension Image {
    init(systemImage: SystemImage) {
        self.init(systemName: systemImage.rawValue)
    }
}

struct AppIcon: View {

    var body: some View {
        // swiftlint:disable:next object_literal
        Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
    }
}
