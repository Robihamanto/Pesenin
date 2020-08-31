//
//  FavouriteView.swift
//  Pesenin
//
//  Created by Robihamanto on 31/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationView {
            List {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.navigationBarTitle("Favourite")
            
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
