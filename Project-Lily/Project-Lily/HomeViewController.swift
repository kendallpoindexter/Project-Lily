//
//  ViewController.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/8/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    let opener = "The big guy is my dad. The little guy is me. The pup is lily, the first dog my dad ever gave me. She is a Norwegian Elkhound and the inspiration for this app. The hope is that you learn about some of the world's awesome but obscure dog breeds."
    
    //MARK: - Outlets
    
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var appDescription: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage()
        appDescription.text = opener
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: - Methods
    
    func displayImage() {
        homeImageView.image = UIImage(named: "Fam")
    }

}

