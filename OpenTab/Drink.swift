//
//  Drink.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-17.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI

struct Drink: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var price: Double
    var isMixable: Bool = false
    var photo: String {
        name.replacingOccurrences(of: " ", with: "")
    }

    #if DEBUG
    static let example = Drink(name: "Gin", price: 8.00)
    #endif
}

struct DrinkSection: Identifiable {
    var id = UUID()
    var name: String
    var items: [Drink]
}

