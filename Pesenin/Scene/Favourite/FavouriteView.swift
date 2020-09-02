//
//  FavouriteView.swift
//  Pesenin
//
//  Created by Robihamanto on 31/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var favourite: Favourite
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favourite.items) { item in
                    MenuItemRow(item: item)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Favourite")
            
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    
    static let favourite = Favourite()
    
    static var previews: some View {
        FavouriteView().environmentObject(favourite)
    }
}
