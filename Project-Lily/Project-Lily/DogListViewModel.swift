//
//  DogListViewModel.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 11/17/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class DogListViewModel {
    var dogs = [Dog]()

    func getDogs() {
        let gotDogsCompletion: ([Dog]) -> Void = { newDogs in
                self.dogs = newDogs
                // delegate?.didFetchDogs()
        }
        NetworkManager().fetchDogs(completion: gotDogsCompletion)
//        NetworkManager().createDogURLSession(completion: gotDogsCompletion)
    }
}
