//
//  DataModel.swift
//  Cocktail app
//
//  Created by Aibek on 04.04.2022.
//

import Foundation

struct Data: Codable {
    var drinks: [Drink]
}

struct Drink: Codable {
    var strDrink = ""
}
