//
//  OrderView.swift
//  Pesenin
//
//  Created by Robihamanto on 29/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("Rp \(item.price)".replacingOccurrences(of: ",", with: "."))
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Bayar")
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Pesanan Saya")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
