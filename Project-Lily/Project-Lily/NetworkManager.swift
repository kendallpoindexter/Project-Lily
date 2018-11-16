//
//  NetworkManager.swift
//  Project-Lily
//
//  Created by Kendall Poindexter on 11/16/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private let urlString = "https://private-52aac-breeds1.apiary-mock.com/breeds"
    
    func createDogURLSession(completion: @escaping (_ dogsResult: [Dog]) -> Void) {
        let session = URLSession.shared
        guard let url = createDogURL(urlString: urlString) else { return }
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failure! \(error)")
            } else if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 {
                if let data = data {
//                    let dogs: [Dog] = [] //self.parse(data: data)!
//                    completion(dogs)
//
//                    self.dogsArray = dogs
//                    DispatchQueue.main.async {
//                        self.dogListTableView.reloadData()
//                    }
                }
                return
            } else {
                print("Failure! \(response!)")
            }
            
        }
        
        dataTask.resume()
    }
    
    func createDogURL(urlString: String) -> URL? {
        guard let url = URL(string: urlString) else {return nil}
        return url
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
    
}


//class ViewModel {
//    var dogs = [Dog]()
//
//    func getDogs() {
//        let gotDogsCompletion: ([Dog]) -> Void = { newDogs in
//                self.dogs = newDogs
//                // delegate?.didFetchDogs()
//        }
//
//        NetworkManager().createDogURLSession(completion: gotDogsCompletion)
//    }
//}
//
