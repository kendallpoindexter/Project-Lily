//
//  DogListViewController.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/8/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class DogListViewController: UIViewController {
    
    
    
    //MARK: - Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Networking Methods
    
    func dogURL() -> URL? {
        let urlString = "https://api.thedogapi.com/v1/breeds?limit=200&page=0"
        guard let url = URL(string: urlString) else {return nil}
        return url
    }
    
    func performDogRequest(with url: URL) -> Data? {
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
        
    }
    
    func parse(data: Data) -> [Dog]? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode([Dog].self, from: data)
            return result
        } catch {
            print("JSON Error \(error)")
            return nil
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - UITableViewController Data Source Methods

extension DogListViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath)
        return cell
    }
    
}

extension DogListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return indexPath
    }
}



