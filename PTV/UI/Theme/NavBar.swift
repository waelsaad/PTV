//
//  NavBar.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

enum NavBar {

    enum Mode {
        case sheet
        case fullScreen
    }

    static func setAppearance(for mode: Mode) {
        
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithOpaqueBackground()

        switch mode {
        case .fullScreen, .sheet:
            coloredNavAppearance.backgroundColor = UIColor(Color.navigationBarBackground)
            coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            coloredNavAppearance.shadowColor = .clear
            UINavigationBar.appearance().tintColor = UIColor(Color.primaryButton)
            UINavigationBar.appearance().barTintColor = UIColor(Color.primaryButton)
        }

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }

}
