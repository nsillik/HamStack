//
//  Item.swift
//  HamStack
//
//  Created by Nick Sillik on 12/23/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}