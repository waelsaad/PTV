//
//  RouteScene.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct RouteScene: View {
    
    @StateObject var viewModel: RouteViewModel

    var body: some View {
        stateView
            .background(errorViewAlert)
            .navigationBarTitle(Content.title)
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
        VStack(alignment: .leading) {
            Section {
                stopsList
            } header: {
                sectionHeader
            }
        }
        .padding([.horizontal])
    }
    
    private var stopsList: some View {
        List(viewModel.stops) { stop in
            NavigationLink(destination: DeparturesScene(
                viewModel: .init(
                    stop: stop,
                    route: viewModel.route,
                    directions: viewModel.directions
                )
            )) {
                Text(stop.stopName)
            }
        } 
        .listStyle(.grouped)
    }
    
    private var sectionHeader: some View {
        VStack(alignment: .leading) {
            Text(viewModel.route.routeName).font(.title)
            HStack {
                Text(Content.serviceStatus).bold()
                Text(viewModel.route.routeServiceStatus.description)
                    .foregroundColor(.red)
            }
        }
        .padding(.top)
    }
    
    @ViewBuilder
    private var errorViewAlert: some View {
        EmptyView()
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text(viewModel.alertErrorType?.title ?? GlobalContent.errorTitle), message: Text(viewModel.alertErrorType?.serverError ?? GlobalContent.otherErrorTitle.stringValue), dismissButton: .default(Text(GlobalContent.okTitle)))
            }
    }
}

struct RouteScene_Previews: PreviewProvider {
    static var previews: some View {
        let routeServiceStatus = RouteServiceStatus(description: "", timestamp: "")
        RouteScene(
            viewModel: .init(
                route: Route(
                    routeServiceStatus: routeServiceStatus,
                    routeType: 1,
                    routeId: 123,
                    routeName: "route name",
                    routeNumber: "12",
                    routeGtfsId: "144"
                )
            )
        )
    }
}
