//
//  DeparturesScene.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct DeparturesScene: View {

    @StateObject var viewModel: DeparturesViewModel
    
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
            stopName
            departureList
        }
    }
    
    private var stopName: some View {
        Text(viewModel.stop.stopName)
            .font(.title)
            .padding()
    }
    
    private var departureList: some View {
        List(viewModel.departuresSoon) { info in
            VStack {
                HStack {
                    Text("\(self.direction(for: info.departure)?.directionName ?? "") ")
                        .bold()
                    Spacer()
                    Text(info.platform)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text(Content.departingIn.stringValue + " \(info.time)")
                    Spacer()
                }
            }
        }
        .listStyle(.grouped)
    }
    
    private func direction(for departure: Departure) -> Direction? {
        viewModel.directions.first { $0.directionId == departure.directionId }
    }
    
    @ViewBuilder
    private var errorViewAlert: some View {
        EmptyView()
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text(viewModel.alertErrorType?.title ?? GlobalContent.errorTitle), message: Text(viewModel.alertErrorType?.serverError ?? GlobalContent.otherErrorTitle.stringValue), dismissButton: .default(Text(GlobalContent.okTitle)))
            }
    }
}

struct DeparturesScene_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let routeServiceStatus = RouteServiceStatus(description: "", timestamp: "")
        
        let stop = Stop(
            disruptionIds: [],
            stopSuburb: "North Melbourne",
            stopName: "North Melb Tram Stop",
            stopId: 57, routeType: 12,
            stopLatitude: 1.1,
            stopLongitude: 22.0,
            stopSequence: 2
        )
        let route = Route(
            routeServiceStatus: routeServiceStatus,
            routeType: 1,
            routeId: 123,
            routeName: "route name",
            routeNumber: "12",
            routeGtfsId: "144"
        )
        
        let direction = Direction(routeDirectionDescription: "", directionId: 1, directionName: "", routeId: 2, routeType: 3)
       
        DeparturesScene(viewModel: .init(stop: stop, route: route, directions: [direction]))
    }
}
