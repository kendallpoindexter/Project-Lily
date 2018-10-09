//
//  BreedClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/8/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class Breed {
    let id: Int?
    let name: String?
    let lifeSpan: String?
    let bredFor: String?
    let breedGroup: String?
    let temperament: String?
    let weight: Weight?
    let height: Height?
    
    init(id: Int, name: String, lifeSpan: String, bredFor: String, breedGroup: String, temperament: String, weight: Weight, height: Height ) {
        self.id = id
        self.name = name
        self.lifeSpan = lifeSpan
        self.bredFor = bredFor
        self.breedGroup = breedGroup
        self.temperament = temperament
        self.weight = weight
        self.height = height
   
    }
}

class Weight {
    let imperial: String
    let metric: String
    
    init(imperial: String, metric: String) {
        self.imperial = imperial
        self.metric = metric
    }
}

class Height {
    let imperial: String
    let metric: String
    
    init(imperial: String, metric: String) {
        self.imperial = imperial
        self.metric = metric
    }
}
