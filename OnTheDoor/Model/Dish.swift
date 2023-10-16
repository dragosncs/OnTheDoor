//
//  Dish.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 13.10.2023.
//

import Foundation

struct Dish: Codable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
