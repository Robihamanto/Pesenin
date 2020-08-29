//
//  MenuItemDetail.swift
//  Pesenin
//
//  Created by Robihamanto on 29/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct MenuItemDetail: View {
    
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
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuItemDetail(item: MenuItem.example)
        }
    }
}
