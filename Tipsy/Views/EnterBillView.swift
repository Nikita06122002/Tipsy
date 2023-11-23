//
//  EnterBillView.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

final class EnterBillView: UIView {
    
    init() {
        super.init(frame: .infinite)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label = UILabel()
    private let textField = UITextField()
    
    private func setupView() {
        self.addSubviews(label, textField)
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        self.backgroundColor = .systemGray6
        
        textField.placeholder = "e.g. 123.56"
        textField.font = .systemFont(ofSize: 25)
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -10),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 130),
            textField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -10),
            textField.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    func endEditing() {
        textField.endEditing(true)
    }
    
    func getText() -> String? {
        return textField.text
    }
}
