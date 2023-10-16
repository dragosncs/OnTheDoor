//
//  CardView.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 12.10.2023.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 15
        cornerRadius = 15
    }
}
