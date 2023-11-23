//
//  UILabel-ext.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text: String? = nil, font: UIFont? = nil, textColor: UIColor? = nil) {
        self.init(frame: .infinite)
        if let text = text {
            self.text = text
        }
        if let font = font {
            self.font = font
        }
        if let color = textColor {
            self.textColor = color
        }
        self.numberOfLines = 0
    }
}
