//
//  Data.swift
//  Cocktail app
//
//  Created by Aibek on 02.04.2022.
//
import UIKit


class Drinks {
    
    
    
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    
    private var drinkArray: [Drink] = []
    
    private func getData(completed: @escaping ()->()) {
        print("We are accessing the url \(urlString)")
        
        //creating a url
        guard let url = URL(string: urlString) else {
            
            print ("Error: couldn't create a URL from \(urlString)"); completed()
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
            print("ERROR: \(error.localizedDescription)")
            
        }
        do {
            let returned = try JSONDecoder ().decode (Returned.self, from: data!)
            self.drinkArray = self.drinkArray + returned.drinks
            
        } catch {
            print ("JSON ERROR")
            
        }
        completed()
    }
    task.resume()
}

}

 
