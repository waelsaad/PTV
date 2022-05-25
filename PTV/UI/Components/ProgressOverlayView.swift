//
//  ProgressOverlayView.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct ProgressOverlayView: View {

    let showProgress: Bool
    let message: LocalizedStringKey

    var body: some View {
        if showProgress {
            VStack {
                CircularProgress()
                    .frame(width: UIConstants.CircularSpinner.medium, height: UIConstants.CircularSpinner.medium)
                    .padding()
                Text(message)
                    .font(.title3)
                    .foregroundColor(.secondaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .frame(minWidth: UIConstants.Overlay.minSize, minHeight: UIConstants.Overlay.minSize)
            .padding()
            .background(Color.progressOverlayBackground.opacity(UIConstants.Overlay.opacity))
            .cornerRadius(UIConstants.Overlay.cornerRadius)
            .padding()
        }
    }
}

struct ProgressOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressOverlayView(showProgress: true, message: "Loading. Please wait because this is taking a long time.")
    }
}
