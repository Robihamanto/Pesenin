//
//  CheckoutView.swift
//  Pesenin
//
//  Created by Robihamanto on 29/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Pesenin Point", "OVO", "ShopeePay", "Gopay", "Dana", "Linkaja"]
    static let tips = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 2
    @State private var isUseLoyaltyDetails = false
    @State private var loyaltyNumbers = ""
    @State private var tipsAmount = 1
    
    var body: some View {
        Form {
            Section {
                Picker("Pilih metode pembayaran", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $isUseLoyaltyDetails.animation()) {
                    Text("Gunakan Poin Pesenin")
                }
                
                if isUseLoyaltyDetails {
                    TextField("Masukkan loyalty code", text: $loyaltyNumbers)
                }
            }
            
            Section (header: Text("Tambahkan tip?")) {
                Picker("Percentage: ", selection: $tipsAmount) {
                    ForEach(0 ..< Self.tips.count) {
                        Text("\(Self.tips[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section ( header: Text("Total: $102")) {
                Button("Selesaikan Pembayaran") {
                    
                }
            }
            
        }.navigationBarTitle("Bayar", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
