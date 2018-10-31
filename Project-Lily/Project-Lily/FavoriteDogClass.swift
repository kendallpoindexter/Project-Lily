//
//  FavoriteDogClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/22/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class FavoriteDogs {
    
    //Try UserDefault within class in order to load favorite dogs from p.list
    let favoriteDefault = UserDefaults.standard
    var favorites: [Dog] = []
    
    
    static var shared = FavoriteDogs()
    
}
