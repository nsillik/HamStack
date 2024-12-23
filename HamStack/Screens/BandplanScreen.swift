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
      VStack(alignment: .leading) {
        Text(bandplan.name)
          .font(.title)
        Text("\(bandplan.minFrequency.converted(to: .megahertz).value)-\(bandplan.maxFrequency.converted(to: .megahertz).value) MHz")
          .font(.subheadline)
      }
      Spacer()
      VStack {

      }
    }
  }
}
