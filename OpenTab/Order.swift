//
//  Order.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-19.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI
import Combine

class Order: ObservableObject {
    @Published var drinks = [Drink]()
    
    var total: Double {
        if drinks.count > 0 {
            return drinks.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    func add(drink: Drink) {
        drinks.append(drink)
    }
    
    func remove(drink: Drink) {
        if let index = drinks.firstIndex(of: drink) {
            drinks.remove(at: index)
        }
    }
}
