//
//  ContentView.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-17.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    var drinkSections: [DrinkSection] = getDrinks()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(drinkSections) { section in
                    Section(header: Text(section.name).font(.subheadline)) {
                        ForEach(section.items) { item in
                            DrinkRow(drink: item)
//                            HStack {
//                                Image(item.name)
//                                    .resizable()
//                                    .frame(width: 50, height: 50)
//                                    .clipShape(Circle())
//                                Text(item.name)
//                            }.padding(4)
                        }
                    }
                }
            }
        .navigationBarTitle("Drink Menu")
        }
    }
}

// create the section and drink arrays
func getDrinks() -> [DrinkSection] {
    let railDrinks: [Drink] = [Drink(name: "Gin", price: 8.00, isMixable: true), Drink(name: "Rum", price: 8.00, isMixable: true), Drink(name: "Tequila", price: 8.00, isMixable: true), Drink(name: "Vodka", price: 8.00, isMixable: true), Drink(name: "Whiskey", price: 8.00, isMixable: true)]
    let beerDrinks: [Drink] = [Drink(name: "Budweiser", price: 7.00), Drink(name: "Coors", price: 7.00), Drink(name: "Heineken", price: 7.00), Drink(name: "Stella Artois", price: 7.00)]
    let nonAlcoholDrinks: [Drink] = [Drink(name: "Coke", price: 5.00), Drink(name: "7up", price: 5.00), Drink(name: "Orange Juice", price: 5.00), Drink(name: "Cranberry Juice", price: 5.00)]

    let drinkSections: [DrinkSection] = [
        DrinkSection(name: "Rail Drinks", items: railDrinks),
        DrinkSection(name: "Beer", items: beerDrinks),
        DrinkSection(name: "Non-Alcohol", items: nonAlcoholDrinks)
    ]
    
    return drinkSections
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
