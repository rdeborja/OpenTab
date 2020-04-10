//
//  DrinkDetail.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-17.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    // we keep a persistent eye on the order as it goes through the entire process
    @EnvironmentObject var order: Order
    
    var drink: Drink
    
    static let drinkMixTypes = ["Coke", "Tonic", "7up", "Gingerale"]
    
    @State private var addCustom: Bool = false
    @State private var addIce: Bool = false
    @State private var drinkMixType = 0
    
    var body: some View {
        VStack {
            Spacer()
            Image(drink.photo)
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            Text(drink.name).padding()
            Form {                
                if drink.isMixable {
                    Picker("Mix \(drink.name) with?", selection: $drinkMixType) {
                        ForEach(0 ..< Self.drinkMixTypes.count, id: \.self) {
                            Text(Self.drinkMixTypes[$0])
                        }
                    }

                    Toggle(isOn: $addCustom.animation()) {
                        Text("Customize drink")
                    }
                    if addCustom {
                        Toggle(isOn: $addIce) {
                            Text("No ice")
                        }
                    }
                }
                Button("Add to order") {
                    self.order.add(drink: self.drink)
                }
                .font(.headline)
             }
        }//.navigationBarTitle(Text(drink.name), displayMode: .inline)
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static let drink: Drink = Drink(name: "Gin", price: 8.00, isMixable: true)
    static var previews: some View {
        DrinkDetail(drink: drink)
    }
}
