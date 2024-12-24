//
//  Bandplan.swift
//  HamStack
//
//  Created by Nick Sillik on 12/23/24.
//

import Foundation

enum Bandplan {
  // Define the BandPlanEntry structure
  struct BandPlanEntry: Identifiable {
    let minFrequency: Measurement<UnitFrequency>
    let maxFrequency: Measurement<UnitFrequency>
    let mode: String
    let step: Measurement<UnitFrequency>
    let color: String
    let name: String

    var id: String {
      return "\(name):\(minFrequency)-\(maxFrequency)"
    }
  }

  // Function to parse the CSV data
  static func parseBandPlanCSV(from csvString: String) -> [BandPlanEntry] {
    var bandPlanEntries: [BandPlanEntry] = []
    let lines = csvString.split(separator: "\n")

    for line in lines {
      // Skip comments and empty lines
      if line.starts(with: "#") || line.trimmingCharacters(in: .whitespaces).isEmpty {
        continue
      }

      let components = line.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
      if components.count >= 6,
         let minFreq = Double(components[0]),
         let maxFreq = Double(components[1]),
         let step = Double(components[3]) {
        let entry = BandPlanEntry(
          minFrequency: .init(value: minFreq, unit: .hertz),
          maxFrequency: .init(value: maxFreq, unit: .hertz),
          mode: components[2],
          step: .init(value: step, unit: .hertz),
          color: components[4],
          name: components[5...components.count - 1].joined().trimmingCharacters(in: .whitespacesAndNewlines)
        )
        bandPlanEntries.append(entry)
      } else {
        print("Warning: Skipping malformed line: \(line)")
      }
    }

    return bandPlanEntries
  }

  // Example usage
  static let csvURL = Bundle.main.url(forResource: "bandplan", withExtension: "csv")!

  static var bandPlanEntries: [BandPlanEntry] = parseBandPlanCSV(from: try! String(contentsOf: csvURL, encoding: .utf8))
}

extension Measurement<UnitFrequency> {
  var display: String {
    switch self.value {
      case let value where value < 1000:
      return "\(value) Hz"
    case let value where value < 1000000:
      return "\(value / 1000) kHz"
    default:
      return "\(value / 1000000) MHz"
    }
  }
}
