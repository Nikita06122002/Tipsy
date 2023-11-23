//
//  TotalView.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

final class TotalView: UIView {
    
    init() {
        super.init(frame: .infinite)
        setupView()
        setupConstraints()
        self.backgroundColor = UIColor(named: "lightGreen")

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label = UILabel(text: "Total per person", font: .systemFont(ofSize: 30))
    private let total = UILabel(text: "56.50", font: .boldSystemFont(ofSize: 45), textColor: .green)
    weak var delegate: UpdateTotalDelegate?
    
    private func setupView() {
        self.addSubviews(label, total)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            total.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            total.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            total.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 10),
            total.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -10)
        ])
        
    }
    func updateText(text: Double) {
        total.text = String(format: "%.2f", text)
    }
}
