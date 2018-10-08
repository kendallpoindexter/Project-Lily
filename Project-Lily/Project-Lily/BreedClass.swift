//
//  BreedClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/8/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class Breed {
    var name: String?
    var weight: String?
    var height: String?
    var lifeSpan: String?
    var breedDescription: String?
    var breedGroup: String?
    
    init(name: String, weight: String, height: String, lifeSpan: String, breedDescription: String, breedGroup: String) {
        self.name = name
        self.weight = weight
        self.height = height
        self.lifeSpan = lifeSpan
        self.breedDescription = breedDescription
        self.breedGroup = breedGroup
    }
}

