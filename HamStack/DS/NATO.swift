//
//  NATO.swift
//  HamStack
//
//  Created by Nick Sillik on 12/23/24.
//

enum NATO {
  static let natoAlphabet: [String: String] = [
    "A": "Alfa", "B": "Bravo", "C": "Charlie", "D": "Delta", "E": "Echo",
    "F": "Foxtrot", "G": "Golf", "H": "Hotel", "I": "India", "J": "Juliett",
    "K": "Kilo", "L": "Lima", "M": "Mike", "N": "November", "O": "Oscar",
    "P": "Papa", "Q": "Quebec", "R": "Romeo", "S": "Sierra", "T": "Tango",
    "U": "Uniform", "V": "Victor", "W": "Whiskey", "X": "X-ray", "Y": "Yankee",
    "Z": "Zulu"
  ]

  static func code(for character: String) -> String? {
    natoAlphabet[character]
  }

  static func character(for code: String) -> String? {
    natoAlphabet.first(where: { $0.value == code })?.key
  }

  static func orderedCharacters() -> [String] {
    natoAlphabet.keys.sorted()
  }
}
