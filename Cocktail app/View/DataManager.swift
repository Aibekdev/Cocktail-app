//
//  DataManager.swift
//  Cocktail app
//
//  Created by Aibek on 02.04.2022.
//
import UIKit

class DataManager {
        
    static func getData(completed: @escaping ([String]?)->()) {
        guard let url = URL(string: Constants.API.urlString) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completed(nil)
                print("ERROR: \(error.localizedDescription)")
            }
            do {
               let returned = try JSONDecoder().decode(DataModel.self, from: data!)
                var drinkArray: [String] = []
                returned.drinks.forEach {
                    drinkArray.append($0.strDrink)
                }
                completed(drinkArray)
            } catch {
                print ("JSON ERROR")
            }
        }
        task.resume()
    }
    
}



