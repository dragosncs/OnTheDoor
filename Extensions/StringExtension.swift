//
//  StringExtension.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 12.10.2023.
//

import Foundation

extension String {
    var asUrl: URL?{
        return URL(string: self)
    }
}
