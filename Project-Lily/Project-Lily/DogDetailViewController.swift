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
    @IBOutlet weak var breedDescription: UILabel!
    @IBOutlet weak var breedSize: UILabel!
    @IBOutlet weak var breedExerciseNeeds: UILabel!
    @IBOutlet weak var breedShedding: UILabel!
    @IBOutlet weak var breedGrooming: UILabel!
    @IBOutlet weak var breedTraining: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        loadImage()
    }
    
    //MARK: - Methods
    
    func loadImage() {
        guard let imageData =  DogImageHelper.getDogImageURL(from: dog) else { return }
        breedImage.layer.borderColor = UIColor.black.cgColor
        breedImage.layer.borderWidth = 1
        //breedImage.layer.cornerRadius = 5
        breedImage.image = UIImage(data: imageData)
    }
    
    func setLabels() {
        breedName.text = dog?.name
        breedDescription.text = dog?.description
        breedSize.text = dog?.size
        breedExerciseNeeds.text = dog?.exercise
        breedShedding.text = dog?.shedding
        breedGrooming.text = dog?.grooming
        breedTraining.text = dog?.training
    }
    
    //MARK: - Actions
    
    @IBAction func favoriteTapped(_ sender: UIButton) {
        guard let dog = dog else { return }
        //favoriteDogs.favoriteDogArray.append(dog)
        FavoriteDogs.shared.favorites.append(dog)
        Persistence.saveFavoriteDogs()

//        print(favoriteDogs[0].name)
        print("There are \(FavoriteDogs.shared.favorites.count) dogs in favoriteDogs")
        
    }
    

}
