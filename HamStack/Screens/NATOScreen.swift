//
//  NATOScreen.swift
//  HamStack
//
//  Created by Nick Sillik on 12/23/24.
//
import SwiftUI
struct NATOScreen: View {
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(NATO.orderedCharacters(), id: \.self) { c in
          VStack {
            HStack {
              Text(c)
                .font(.title)
              Spacer()
              Text(NATO.code(for: c) ?? "unk")
                .font(.title)
            }
            Divider()
          }
        }
        .padding()
      }
    }
  }
}

#Preview {
  NATOScreen()
}
