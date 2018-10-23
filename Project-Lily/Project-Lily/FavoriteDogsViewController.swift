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
    var dogImageHelper = DogImageHelper()
    
    //MARK: - Outlets
    
    @IBOutlet weak var favoriteDogsCollection: UICollectionView!
    

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteDogsCollection.reloadData()

    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: UICollectionViewDataSource

extension FavoriteDogsViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        favoriteDogsCollection.reloadData()

        print("There are \(FavoriteDogs.shared.count) dogs in favorites.")
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return FavoriteDogs.shared.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteDogImageCell
        
        guard let imageData = dogImageHelper.getDogImageURL(from: FavoriteDogs.shared[indexPath.row]) else { return cell }
        
       cell.loadImage(with: imageData)
        
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension FavoriteDogsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    
}
