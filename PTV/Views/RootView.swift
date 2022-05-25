//
//  PTVPlannerType.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI
import Combine

struct RootView: View {
    var body: some View {
        NavigationView {
            RouteTypesView(viewModel: .init())
                .navigationBarTitle("PTV SwiftUI 🥳")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
