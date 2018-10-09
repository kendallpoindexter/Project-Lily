//
//  DogListViewController.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 10/8/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class DogListViewController: UIViewController {
    
    //MARK: - Properties
    
    var dogDatabase = DogDatabase()
   
    //MARK: - Outlets
    
    @IBOutlet weak var dogListTableView: UITableView!
    
    
    //MARK: - Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDogList()
        getDogData()

        // Do any additional setup after loading the view.
    }
    
    func configureDogList() {
        dogListTableView.dataSource = self
        dogListTableView.delegate = self
    }
    
    //MARK: - Methods
    
    func getDogData() {
        guard let url = self.dogURL() else { return }
        guard let jsonString = performDogRequest(with: url) else { return }
//        self.dogDatabase.dogsArray = parse(data: jsonString)
        if let dogs = parse(data: jsonString) {
            dogDatabase.dogsArray = dogs
        } else {
            dogDatabase.dogsArray = []
        }
        
        print(dogDatabase.dogsArray[0].name)
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
        return dogDatabase.dogsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath)
        let dogs = dogDatabase.dogsArray[indexPath.row]
        
        cell.textLabel?.text = dogs.name
        return cell
    }
    
}

extension DogListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return indexPath
    }
}



