//
//  CircularProgress.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct CircularProgress: View {

    let colours = [Color.progressSpinner.opacity(0), Color.progressSpinner]

    @State private var rotation: Double = 0

    var body: some View {
        let conic = AngularGradient(gradient: Gradient(colors: colours), center: .center, startAngle: .zero, endAngle: .degrees(360))
        let lineWidth: CGFloat = 4

        let animation = Animation
            .linear(duration: 1.5)
            .repeatForever(autoreverses: false)

        return ZStack {
            GeometryReader { geometry in
                Circle()
                    .stroke(colours.first ?? .white, lineWidth: lineWidth)

                Circle()
                    .trim(from: lineWidth / 100, to: 1 - lineWidth / 50)
                    .stroke(conic, style: StrokeStyle(lineWidth: lineWidth * geometry.size.width / 45, lineCap: .round))
                    .rotationEffect(.degrees(rotation))
                    .padding(geometry.size.width / 80 * 4)
                    .onAppear {
                        self.rotation = 0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            withAnimation(animation) {
                                self.rotation = 360
                            }
                        }
                    }
            }
        }
    }
}

struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CircularProgress()
                .frame(width: 80, height: 80)
            Text("Requesting...")
                .font(.title)
                .fontWeight(.light)
                .padding()
            
            CircularProgress()
                .frame(width: UIConstants.CircularSpinner.small, height: UIConstants.CircularSpinner.small)
        }
    }
}
