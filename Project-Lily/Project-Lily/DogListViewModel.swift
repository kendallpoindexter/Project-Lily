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
        
        NetworkManager().fetchDogs { (newDogs) in
            self.dogs = newDogs
            print(self.dogs)
            self.delegate?.didFetchDogs()
        }
    }
}

extension DogListViewModel {
    func numberOfCells() -> Int {
        let cells = dogs.count
        return cells
    }
}
