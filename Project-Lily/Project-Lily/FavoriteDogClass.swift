//
//  FavoriteDogClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/22/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class FavoriteDogs {
    var favorites: [Dog] = []
    
    static var shared = FavoriteDogs().favorites
    
}
