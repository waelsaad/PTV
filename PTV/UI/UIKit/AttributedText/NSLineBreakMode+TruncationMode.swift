//
//  NSLineBreakMode+TruncationMode.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

// swiftlint:disable indentation_width

import SwiftUI

extension NSLineBreakMode {
  init(truncationMode: Text.TruncationMode) {
    switch truncationMode {
    case .head:
      self = .byTruncatingHead
    case .tail:
      self = .byTruncatingTail
    case .middle:
      self = .byTruncatingMiddle
    @unknown default:
      self = .byWordWrapping
    }
  }
}
