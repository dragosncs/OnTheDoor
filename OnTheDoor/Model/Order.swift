//
//  Order.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 16.10.2023.
//

import Foundation

struct Order: Codable {
    let id: String?
    let name: String?
    let dish: Dish?
}
