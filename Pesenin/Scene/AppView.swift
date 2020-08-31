//
//  AppView.swift
//  Pesenin
//
//  Created by Robihamanto on 29/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            MenuView().tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
            
            OrderView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Pesanan")
            }
            
            FavouriteView().tabItem {
                Image(systemName: "heart")
                Text("Favourite")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
