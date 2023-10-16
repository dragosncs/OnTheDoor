//
//  UIVIew+Extension.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 12.10.2023.
//

import UIKit

extension UIView {
    
    
  @IBInspectable  var cornerRadius: CGFloat {
      get { return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
