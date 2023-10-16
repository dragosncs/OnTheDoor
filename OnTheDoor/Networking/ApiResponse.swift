//
//  ApiResponse.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 16.10.2023.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
