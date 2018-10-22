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
    var favoriteDogs = FavoriteDogs.shared
    
    //MARK: - Outlets
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var breedImage: UIImageView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBreedName()
        getBreedImage()
    }
    
    //MARK: - Methods
    
    func getBreedImage() {
        guard let dog = dog else { return }
        let imageURLString = dog.imageURL
        
        guard let imageURL = URL(string: imageURLString),
            let imageData = convertImageURL(with: imageURL) else { return }
        
        loadImage(with: imageData)
    }
    
    func convertImageURL(with imageURL: URL) -> Data? {
        do {
            let data = try Data(contentsOf: imageURL)
            return data
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func loadImage(with data: Data) {
        breedImage.image = UIImage(data: data)
    }
    
    func loadBreedName() {
        
        breedName.text = dog?.name
        
    }

    //MARK: - Actions
    
    @IBAction func favoriteTapped(_ sender: UIButton) {
        guard let dog = dog else { return }
        //favoriteDogs.favoriteDogArray.append(dog)
        favoriteDogs.append(dog)
        print(favoriteDogs[0].name)
        
    }
    

}
