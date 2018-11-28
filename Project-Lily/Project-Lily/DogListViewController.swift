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
    
    var filteredDogArray = [Dog]()
    var selectedIndex: Int?
    var isSearching = false
    var dogListViewModel = DogListViewModel()
    
    //MARK: - Outlets
    
    @IBOutlet weak var dogListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogListViewModel.delegate = self
        configureDogList()
        dogListViewModel.getDogs()
        configureSearchBar()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifiers.detailSegue.rawValue :
            guard let dogDetailVC = segue.destination as? DogDetailViewController else { return }
            guard let selectedIndex = selectedIndex else { return }
            dogDetailVC.dog = dogListViewModel.dogs[selectedIndex]
            
            if isSearching == true {
                dogDetailVC.dog = filteredDogArray[selectedIndex]
            }
        default:
            return 
        }
    }
}

//MARK: - UITableViewController Data Source Methods

extension DogListViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == true {
            return filteredDogArray.count
        }
        return dogListViewModel.dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath)
        let dogs: Dog
        
        if isSearching == true {
            dogs = filteredDogArray[indexPath.row]
        } else {
            
            dogs = dogListViewModel.dogs[indexPath.row]
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
            filteredDogArray = dogListViewModel.dogs.filter() {$0.name.contains(text) || $0.id.contains(text) || $0.size.contains(text)}
            dogListTableView.reloadData()
        }
    }
}

extension DogListViewController: DogListViewModelDelegate {
    func didFetchDogs() {
        DispatchQueue.main.async {
            self.dogListTableView.reloadData()
        }
    }
}



