//
//  CheckoutView.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-20.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    // @EnvironmentObject happens for external objects
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Credit Card"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    @State private var customTip = false
    
    // Use @State for internal variables, is set to Cash by default
    @State private var paymentType = 1
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
            
            Section(header: Text("Add a tip?")) {
                if !customTip {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(0 ..< Self.tipAmounts.count) {
                            Text("\(Self.tipAmounts[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            Section(header: Text("Total: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm Order"){
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
