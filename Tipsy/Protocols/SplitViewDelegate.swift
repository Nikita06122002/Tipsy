//
//  SplitViewDelegate.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

protocol SplitViewDelegate: AnyObject {
    func stepperValueChanged(to newValue: Double)
}
