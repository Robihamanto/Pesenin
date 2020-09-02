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
    @EnvironmentObject var favourite: Favourite
    @State var isFavourite = false
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
            
            Spacer()
            
            HStack {
                Button("Tambahkan ke Pesanan") {
                    self.order.add(item: self.item)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(15)
                .background(Color(UIColor.systemGreen))
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.headline)
                
                Button(action: {
                    
                    if self.isFavourite {
                        self.favourite.remove(item: self.item)
                    } else {
                        self.favourite.add(item: self.item)
                    }
                    
                    self.isFavourite = !self.isFavourite
                    
                }) {
                    
                    if isFavourite {
                        Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.red)
                        
                    } else {
                        Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.red)
                    }
                    
                }.padding(10)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(10)
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
        .onAppear(perform: fetchIsFavourite)
    }
    
    private func fetchIsFavourite() {
        self.isFavourite = favourite.isFavourite(item: self.item)
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static let favourite = Favourite()
    
    static var previews: some View {
        NavigationView {
            MenuItemDetail(item: MenuItem.example)
                .environmentObject(order)
                .environmentObject(favourite)
        }
    }
}
