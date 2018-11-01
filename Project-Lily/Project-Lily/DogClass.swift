//
//  DogClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/9/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

struct Dog: Decodable {
    let id: String
    let name: String
    let size: String
    let exercise: String
    let shedding: String
    let grooming: String
    let training: String
    let description: String
    let imageURL: String
}
