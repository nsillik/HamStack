//
//  Bandplan.swift
//  HamStack
//
//  Created by Nick Sillik on 12/23/24.
//

import SwiftUI

struct BandplanScreen: View {
  let bandplans = Bandplan.bandPlanEntries

  var body: some View {
    ScrollView {
      LazyVStack(spacing: 0) {
        ForEach(bandplans) { bandplan in
          bandplanCard(bandplan)
        }
      }
    }
  }

  func bandplanCard(_ bandplan: Bandplan.BandPlanEntry) -> some View {
    HStack {
      VStack {
        bandplan.color.color()
      }
      .frame(minWidth: 16, maxWidth: 16, maxHeight: .infinity)
      Group {
        VStack(alignment: .leading) {
          Text(bandplan.name.isEmpty ? "Unknown" : bandplan.name)
            .font(.title)
          Text("\(bandplan.minFrequency.display) – \(bandplan.maxFrequency.display)")
            .font(.subheadline)
        }
        Spacer()
        VStack(alignment: .trailing) {
          Spacer()
          Text(bandplan.mode)
            .fontWeight(.semibold)
          Spacer()
        }
      }
      .padding()
    }
  }
}

#Preview {
  BandplanScreen()
}
