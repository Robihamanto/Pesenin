//
//  MenuItemDetail.swift
//  Pesenin
//
//  Created by Robihamanto on 29/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct MenuItemDetail: View {
    
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text(item.photoCredit)
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
            .padding()
            
            Button("Tambahkan ke Pesanan") {
                self.order.add(item: self.item)
            }.font(.headline)
            
            
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            MenuItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
