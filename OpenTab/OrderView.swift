//
//  OrderView.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-19.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.drinks) { drink in
                        HStack {
                            Text(drink.name)
                            Spacer()
                            Text("$\(drink.price, specifier: "%.2f")")
                        }
                    }.onDelete(perform: deleteDrinks)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }.disabled(order.drinks.isEmpty)
            }
        .navigationBarTitle("Order")
        .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteDrinks(at offsets: IndexSet)  {
        order.drinks.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
