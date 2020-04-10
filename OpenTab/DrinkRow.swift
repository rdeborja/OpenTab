//
//  DrinkRow.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-17.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI

struct DrinkRow: View {
    var drink: Drink
    
    var body: some View {
        NavigationLink(destination: DrinkDetail(drink: drink)) {
            HStack {
                Image(drink.photo)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(drink.name)
                        .font(.headline)
                    Text("$\(drink.price, specifier: "%.2f")")
                        .font(.subheadline)
                }
                
                
            }.padding(4)
        }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(drink: Drink.example)
    }
}
