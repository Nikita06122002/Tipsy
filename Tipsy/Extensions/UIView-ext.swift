//
//  UIView-ext.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

extension UIView {
    
        func addSubviews(_ views: UIView...) {
            for view in views {
                view.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(view)
            }
            
    }
}
