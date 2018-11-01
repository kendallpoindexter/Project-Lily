//
//  DogClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/9/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

struct Dog: Codable {
  
    let id: String
    let name: String
    let size: String
    let exercise: String
    let shedding: String
    let grooming: String
    let training: String
    let description: String
    let imageURL: String
    
//    init(id: String, name: String, size: String, imageURL: String) {
//        self.id = id
//        self.name = name
//        self.size = size
//        self.imageURL = imageURL
//    }
//    
//    required convenience init(coder aDecoder: NSCoder) {
//        let id = aDecoder.decodeObject(forKey: "id") as! String
//        let name = aDecoder.decodeObject(forKey: "name") as! String
//        let size = aDecoder.decodeObject(forKey: "size") as! String
//        let imageURL = aDecoder.decodeObject(forKey: "imageURL") as! String
//        
//        self.init(id: id, name: name, size: size, imageURL: imageURL)
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(id, forKey: "id")
//        aCoder.encode(name, forKey: "name")
//        aCoder.encode(size, forKey: "size")
//        aCoder.encode(imageURL, forKey: "imageURL")
//    }
}
