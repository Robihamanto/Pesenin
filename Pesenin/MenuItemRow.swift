//
//  MenuItemRow.swift
//  Pesenin
//
//  Created by Robihamanto on 29/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct MenuItemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G":.black, "N":.red, "S":.blue, "V":.green]
    
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: MenuItemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle()
                    .stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name).font(.headline)
                    Text("Rp \(item.price)")
                }.layoutPriority(1)
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restrictions in
                    Text(restrictions)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restrictions])
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(item: MenuItem.example)
    }
}
