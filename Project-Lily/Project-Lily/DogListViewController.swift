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
    var filteredDogArray = [Dog]()
    var selectedIndex: Int?
    var isSearching = false
   
    //MARK: - Outlets
    
    @IBOutlet weak var dogListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDogList()
        createDogURLSession()
        //getDogData()
        configureSearchBar()

        // Do any additional setup after loading the view.
    }
    
    func configureDogList() {
        dogListTableView.dataSource = self
        dogListTableView.delegate = self
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    //MARK: - Methods
    
//    func getDogData() {
//        guard let url = self.dogURL() else { return }
//        guard let jsonString = performDogRequest(with: url) else { return }
////        self.dogDatabase.dogsArray = parse(data: jsonString)
//        if let dogs = parse(data: jsonString) {
//            dogDatabase.dogsArray = dogs
//        } else {
//            dogDatabase.dogsArray = []
//        }
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "DetailSegue":
            guard let DogDetailViewController = segue.destination as? DogDetailViewController else { return }
            guard let selectedIndex = selectedIndex else { return }
            DogDetailViewController.dog = dogDatabase.dogsArray[selectedIndex]
            
            if isSearching == true {
                DogDetailViewController.dog = filteredDogArray[selectedIndex]
            }
        default:
            return 
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
        
        if isSearching == true {
            return filteredDogArray.count
        }
        return dogDatabase.dogsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath)
        let dogs: Dog
       
        
        if isSearching == true {
            dogs = filteredDogArray[indexPath.row]
        } else {
            
            dogs = dogDatabase.dogsArray[indexPath.row]
        }
        
        cell.textLabel?.text = dogs.name
        return cell
    }
    
}

//MARK: - UITableViewController Delegate Methods

extension DogListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        selectedIndex = indexPath.row
        return indexPath
    }
}

//MARK: - Networking Methods

extension DogListViewController {
    
    
    
    func createDogURLSession() {
        let session = URLSession.shared
        guard let url = dogURL() else { return }
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failure! \(error)")
            } else if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 {
                if let data = data {
                    self.dogDatabase.dogsArray = self.parse(data: data)!
                    DispatchQueue.main.async {
                        self.dogListTableView.reloadData()
                    }
                }
                return
            } else {
                print("Failure! \(response!)")
            }

        }
        
        dataTask.resume()
    }
    
//    func performDogRequest(with url: URL) -> Data? {
//        do {
//            return try Data(contentsOf: url)
//        } catch {
//            print("Download Error: \(error.localizedDescription)")
//            return nil
//        }
//    }
    
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
    
}

//MARK: - UISearchBar Delegate Implementation 

extension DogListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearching = false
            view.endEditing(true)
            dogListTableView.reloadData()
        } else {
            isSearching = true
            guard let text = searchBar.text else {return}
            filteredDogArray = dogDatabase.dogsArray.filter() {$0.name.contains(text) || $0.id.contains(text) || $0.size.contains(text)}
            dogListTableView.reloadData()
        }
    }
    
}



