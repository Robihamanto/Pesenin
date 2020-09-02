//
//  Favourite.swift
//  Pesenin
//
//  Created by Robihamanto on 31/08/20.
//  Copyright © 2020 Robihamanto. All rights reserved.
//

import Foundation

class Favourite: ObservableObject {
    
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}

