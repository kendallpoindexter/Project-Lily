//
//  FavoriteDogsViewController.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/22/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FavoriteDogsViewController: UICollectionViewController {
    
    //MARK: - Properties

    //var favorites = FavoriteDogs.shared
    var selectedIndex: Int?
    
    //MARK: - Outlets
    
    @IBOutlet weak var favoriteDogsCollection: UICollectionView!
    
  
    

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Persistence.loadFavorites()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteDogsCollection.reloadData()

    }
    
    //MARK: - Methods
    
  

     // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dogDetailViewController = segue.destination as? DogDetailViewController, let selectedIndex = selectedIndex else { return }
        
        dogDetailViewController.dog = FavoriteDogs.shared.favorites[selectedIndex]
        
    }

}

// MARK: UICollectionViewDataSource

extension FavoriteDogsViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        favoriteDogsCollection.reloadData()

        print("There are \(FavoriteDogs.shared.favorites.count) dogs in favorites.")
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return FavoriteDogs.shared.favorites.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteDogImageCell
        
        guard let imageData = DogImageHelper.getDogImageURL(from: FavoriteDogs.shared.favorites[indexPath.row]) else { return cell }
        
       cell.loadImage(with: imageData)
        
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension FavoriteDogsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        selectedIndex = indexPath.row
        
        return true
        
    }
    
    
}
