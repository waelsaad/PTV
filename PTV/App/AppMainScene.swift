//
//  AppMainScene.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

@main
struct AppMainScene: App {
    
    @ObservedObject var viewModel = AppMainScene.AppMainViewModel()
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    init() {
    
        LogType.setItemsToLog(to: LogType.allCases)
        
        if #unavailable(iOS 15) {
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
        }
        
        NavBar.setAppearance(for: .fullScreen)
    }
    
    var body: some Scene {
        WindowGroup {
            RouteTypesScene(viewModel: .init())
        }
    }
}
