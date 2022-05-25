//
//  TextSizeViewModel.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

// swiftlint:disable indentation_width

import SwiftUI

final class TextSizeViewModel: ObservableObject {
  @Published var textSize: CGSize?

  func didUpdateTextView(_ textView: AttributedTextImpl.TextView) {
    textSize = textView.intrinsicContentSize
  }
}
