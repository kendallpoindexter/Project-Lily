//
//  BreedImageClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/10/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class BreedImage {
    let id: Int?
    let url: String?
    let breeds: Breed
    
    init(id: Int, url: String, breeds: Breed) {
        self.id = id
        self.url = url
        self.breeds = breeds
    }
}
