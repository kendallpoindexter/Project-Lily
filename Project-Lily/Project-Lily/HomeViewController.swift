//
//  ViewController.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/8/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var homeImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: - Methods
    
    func displayImage() {
        homeImageView.image = UIImage(named: "Fam")
    }

}

