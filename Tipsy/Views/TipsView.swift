//
//  SelectView.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

final class TipsView: UIView {
    
    init() {
        super.init(frame: .infinite)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label = UILabel(text: "Select tips", font: .systemFont(ofSize: 25), textColor: .lightGray)
    private let zeroButton = UIButton(title: "0%", font: .systemFont(ofSize: 35), titleColor: .green)
    private let tenButton = UIButton(title: "10%", font: .systemFont(ofSize: 35), titleColor: .green)
    private let twentyButton = UIButton(title: "20%", font: .systemFont(ofSize: 35), titleColor: .green)
    
    private var currentTipPercentage: Double = 0.0
    
    var onTipSelected: ((Double) -> Void)?
    
    private let stackView = UIStackView()
    
    private func setupView() {
        stackView.addArrangedSubview(zeroButton)
        stackView.addArrangedSubview(tenButton)
        stackView.addArrangedSubview(twentyButton)
        self.addSubviews(label, stackView)

        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.contentMode = .scaleToFill
        
        zeroButton.setTitleColor(.red, for: .selected)
        tenButton.setTitleColor(.red, for: .selected)
        twentyButton.setTitleColor(.red, for: .selected)
        zeroButton.tag = 0
        tenButton.tag = 1
        twentyButton.tag = 2
        
        zeroButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        tenButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        twentyButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -30),
            
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
//    func zeroAction(_ target: Any, action: Selector) {
//        zeroButton.addTarget(target, action: action, for: .touchUpInside)
//    }
//    
//    func tenAction(_ target: Any, action: Selector) {
//        tenButton.addTarget(target, action: action, for: .touchUpInside)
//    }
//    
//    func twentyAction(_ target: Any, action: Selector) {
//        twentyButton.addTarget(target, action: action, for: .touchUpInside)
//    }
//    
    @objc private func buttonTapped(_ sender: UIButton) {
        [zeroButton, tenButton, twentyButton].forEach { $0.isSelected = false }
        sender.isSelected = true

        switch sender.tag {
        case 0:
            currentTipPercentage = 0.0
        case 1:
            currentTipPercentage = 0.10
        case 2:
            currentTipPercentage = 0.20
        default:
            return
        }

        onTipSelected?(currentTipPercentage)
    }
    
    func getCurrentTipPercentage() -> Double {
        return currentTipPercentage

    }
}
