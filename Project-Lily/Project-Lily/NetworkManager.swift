//
//  NetworkManager.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 11/16/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private let urlString = "https://private-52aac-breeds1.apiary-mock.com/breeds"
    
    
    
    
    
    
    
    
    
    
    
    func createDogURL(urlString: String) -> URL? {
        guard let url = URL(string: urlString) else {return nil}
        return url
    }
}
