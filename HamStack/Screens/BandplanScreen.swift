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
      LazyVStack {
        ForEach(bandplans) { bandplan in
          bandplanCard(bandplan)
          Divider()
        }
      }
    }
  }

  func bandplanCard(_ bandplan: Bandplan.BandPlanEntry) -> some View {
    HStack {
      VStack {
        bandplan.color.color()
      }
      .frame(width: 16, height: 16)
      VStack(alignment: .leading) {
        Text(bandplan.name.isEmpty ? "Unknown" : bandplan.name)
          .font(.title)
        Text("\(bandplan.minFrequency.converted(to: .megahertz).value)-\(bandplan.maxFrequency.converted(to: .megahertz).value) MHz")
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
