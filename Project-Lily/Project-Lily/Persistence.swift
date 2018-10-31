//
//  Persisence.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/31/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class Persistence {
    
   static func saveFavoriteDogs() {
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(FavoriteDogs.shared.favorites)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding data! Error: \(error)")
        }
    }
    
   static func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    static func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Favorites.plist")
    }
    
    static func loadFavorites() {
        let path = dataFilePath()
        if let data  = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                FavoriteDogs.shared.favorites = try decoder.decode([Dog].self, from: data)
            } catch {
                print("ERROR: \(error)")
            }
        }
    }
    
}
