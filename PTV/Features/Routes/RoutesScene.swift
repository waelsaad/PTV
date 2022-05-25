//
//  RoutesScene.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct RoutesScene: View {
    
    @StateObject var viewModel: RoutesViewModel
    
    var body: some View {
        stateView
            .background(errorViewAlert)
            .onAppear(perform: viewModel.fetch)
    }

    @ViewBuilder
    private var stateView: some View {
        switch viewModel.state {
        case .loading: loading
        case .loaded: mainContent
        case .error: EmptyView()
        }
    }
    
    private var loading: some View {
        HStack {
            ProgressView()
            Text(" ")
            Text(GlobalContent.loadingMessage)
                .foregroundColor(.secondaryText)
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        List(viewModel.routes) { route in
            getRouteNavigationLink(route: route)
        }
        .padding(.top)
    }
    
    private func getRouteNavigationLink(route: Route) -> some View {
        NavigationLink(destination: RouteScene(viewModel: .init(route: route))) {
            if let routeTypeImage = viewModel.selectedRoute?.imageName {
                Image(routeTypeImage)
                    .resizable()
                    .frame(width: UIConstants.ImageSize.verySmall, height: UIConstants.ImageSize.verySmall)
            }
            Text(route.routeName)
        }
    }
    
    @ViewBuilder
    private var errorViewAlert: some View {
        EmptyView()
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text(viewModel.alertErrorType?.title ?? GlobalContent.errorTitle), message: Text(viewModel.alertErrorType?.serverError ?? GlobalContent.otherErrorTitle.stringValue), dismissButton: .default(Text(GlobalContent.okTitle)))
            }
    }
}

struct RoutesScene_Previews: PreviewProvider {
    static var previews: some View {
        RoutesScene(viewModel: .init(routeTypes: [], selectedRoute: RouteType(routeTypeName: "Train", routeType: 0)))
    }
}
