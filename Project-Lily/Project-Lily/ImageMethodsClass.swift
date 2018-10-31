//
//  ImageMethodsClass.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/22/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class DogImageHelper {
    
//    DogImageHelper().getDogImageURL
//    DogImageHelper.getDogImageURL

   static func getDogImageURL(from dog: Dog?) -> Data? {
        
        guard let dog = dog else { return nil }
        let imageURLString = dog.imageURL
        
        // Can add certain error messages
        guard let imageURL = URL(string: imageURLString) else { return nil }
        guard let imageData = convertImageURL(with: imageURL) else { return nil}
        return imageData
    }
    
   private static func convertImageURL(with imageURL: URL) -> Data? {
        do {
            let data = try Data(contentsOf: imageURL)
            return data
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
    }
    
   
}

//
