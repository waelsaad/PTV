//
//  InfoBox.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import SwiftUI

struct InfoBox: View {

    let message: String

    init(localizedMessage: LocalizedStringKey) {
        message = localizedMessage.stringValue
    }

    init(message: String) {
        self.message = message
    }

    var body: some View {
        HStack(alignment: .top) {
            Image(systemImage: .infoFill)
                .foregroundColor(.navyInLightTealInDark)

            AttributedText(.markdown(text: message, textStyle: .footnote))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cornerRadius(UIConstants.CornerRadius.container)
        .background(
            RoundedRectangle(cornerRadius: UIConstants.CornerRadius.infoBox)
                .stroke(lineWidth: UIConstants.Border.fine)
                .foregroundColor(.navyInLightTealInDark)
        )
    }

}

struct InfoBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Normal text")
            InfoBox(message: "Description text here")
                .padding()
        }
    }
}
