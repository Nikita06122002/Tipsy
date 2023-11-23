//
//  UIButton-ext.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title: String? = nil, backgroundColor: UIColor? = nil, font: UIFont? = nil, cornerRadius: CGFloat? = nil, titleColor: UIColor? = nil) {
        self.init(frame: .infinite)
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        if let color = backgroundColor {
            self.backgroundColor = color
        }
        if let font = font {
            self.titleLabel?.font = font
        }
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        if let color = titleColor {
            self.setTitleColor(color, for: .normal)
        }
    }
}
