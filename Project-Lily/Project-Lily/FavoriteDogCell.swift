//
//  FavoriteDogCell.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/22/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class FavoriteDogImageCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteDogImage: UIImageView!
    
    func loadImage(with data: Data) {
        favoriteDogImage.image = UIImage(data: data)
    }
    
    
}
