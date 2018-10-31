//
//  DogDetailViewController.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/8/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class DogDetailViewController: UIViewController {
    
    //MARK: - Properties
    var dog: Dog?
//    var favoriteDogs = FavoriteDogs.shared
    //var dogImageHelper = DogImageHelper()
    
    //MARK: - Outlets
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var breedImage: UIImageView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBreedName()
        loadImage()
    }
    
    //MARK: - Methods
    
    func loadImage() {
        guard let imageData =  DogImageHelper.getDogImageURL(from: dog) else { return }
        breedImage.image = UIImage(data: imageData)
    }
    
    func loadBreedName() {
        
        breedName.text = dog?.name
    }
    
    func encodeData() {
        do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: FavoriteDogs.shared.favorites,
                                                                     requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: "favoriteDogs")
        } catch let error {
            print("Failed to encode object! \(error)")
        }
        
    }

    //MARK: - Actions
    
    @IBAction func favoriteTapped(_ sender: UIButton) {
        guard let dog = dog else { return }
        //favoriteDogs.favoriteDogArray.append(dog)
        FavoriteDogs.shared.favorites.append(dog)
        encodeData()

//        print(favoriteDogs[0].name)
        print("There are \(FavoriteDogs.shared.favorites.count) dogs in favoriteDogs")
        
    }
    

}
