//
//  AllDishes.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 16.10.2023.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
