//
//  RouteTypesScene.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct RouteTypesScene: View {
    
    @StateObject var viewModel: RouteTypesViewModel
    
    var body: some View {
        NavigationView {
            stateView
                .navigationTitle(Content.title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        todayView
                    }
                }
        }
        .background(errorViewAlert)
        .onAppear(perform: viewModel.fetch)
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private var stateView: some View {
        switch viewModel.state {
        case .loading: loading
        case .loaded: mainContent
        case .error: EmptyView() // errorView(error) - custom error view not required for now.
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
    
    private var todayView: some View {
        VStack(alignment: .leading, spacing: UIConstants.Padding.buttonTextImageSpace) {
            HStack {
                Image(appImage: .whiteCalendar)
                Text(viewModel.todayDate)
                    .foregroundColor(.white)
            }
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        VStack {
            routeTypes
                .padding(.top)
            infoView
        }
    }
    
    private var infoView: some View {
        InfoBox(localizedMessage: Content.infoMessage)
            .padding()
    }
    
    private var routeTypes: some View {
        List(viewModel.routeTypes) { routeType in
            NavigationLink(destination: getRouteNavigationLink(routeType: routeType)) {
                HStack {
                    Image(routeType.imageName)
                        .resizable()
                        .frame(width: UIConstants.ImageSize.verySmall, height: UIConstants.ImageSize.verySmall)
                    Text(routeType.routeTypeName)
                }
                .padding()
            }
        }
    }
    
    private func getRouteNavigationLink(routeType: RouteType) -> some View {
        RoutesScene(viewModel: .init(routeTypes: [routeType], selectedRoute: routeType))
            .navigationBarTitle(routeType.routeTypeName)
        
    }
    
    @ViewBuilder
    private var errorViewAlert: some View {
        EmptyView()
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text(viewModel.alertErrorType?.title ?? GlobalContent.errorTitle), message: Text(viewModel.alertErrorType?.serverError ?? GlobalContent.otherErrorTitle.stringValue), dismissButton: .default(Text(GlobalContent.okTitle)))
            }
    }
}

struct RouteTypesScene_Previews: PreviewProvider {
    static var previews: some View {
        RouteTypesScene(viewModel: .init())
    }
}
