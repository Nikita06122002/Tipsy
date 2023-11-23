//
//  CalculateView.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

final class CalculateView: UIView {
    private let calculateButton = UIButton()
    
    init() {
        super.init(frame: .infinite)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubviews(calculateButton)
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.backgroundColor = .green
        calculateButton.titleLabel?.font = .systemFont(ofSize: 35)
        calculateButton.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            calculateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            calculateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
