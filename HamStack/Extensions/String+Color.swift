//
//  String+Color.swift
//  HamStack
//
//  Created by Nick Sillik on 12/23/24.
//

// Function to convert a hex string to a SwiftUI Color
import SwiftUI
extension String {
  func color() -> Color {
    let colorString = self.lowercased()
    guard colorString.hasPrefix("#"), colorString.count == 9 else {
      return .clear
    }

    let hexString = String(colorString.dropFirst())
    guard let hexValue = UInt32(hexString, radix: 16) else {
      return .clear
    }

    let alpha = Double((hexValue >> 24) & 0xFF) / 255.0
    let red = Double((hexValue >> 16) & 0xFF) / 255.0
    let green = Double((hexValue >> 8) & 0xFF) / 255.0
    let blue = Double(hexValue & 0xFF) / 255.0

    return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
  }
}
