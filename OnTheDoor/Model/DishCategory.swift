//
//  DishCategory.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 12.10.2023.
//

import Foundation

struct DishCategory: Codable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
