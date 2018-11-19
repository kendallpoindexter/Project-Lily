//
//  DogListViewModel.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 11/17/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

protocol DogListViewModelDelegate: class {
    func didFetchDogs()
}

class DogListViewModel {
    var dogs = [Dog]()
   weak var delegate: DogListViewModelDelegate?

    func getDogs() {
        let gotDogsCompletion: ([Dog]) -> Void = { newDogs in
                self.dogs = newDogs
                print(self.dogs)
                self.delegate?.didFetchDogs()
        }
        NetworkManager().fetchDogs(completion: gotDogsCompletion)
    }
}
