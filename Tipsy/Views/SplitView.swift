//
//  SplitView.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

final class SplitView: UIView {
    
    init() {
        super.init(frame: .infinite)
        setupView()
        setupConstraints()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label = UILabel(text: "Choose Split", font: .systemFont(ofSize: 25), textColor: .lightGray)
    private let numberLabel = UILabel(text: "2", font: .systemFont(ofSize: 35), textColor: .green)
    private let stepper = UIStepper()
    weak var delegate: SplitViewDelegate?
    
    private let stackView = UIStackView()

    private func setupView() {
        
        self.addSubviews(label, stackView)
        
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(stepper)
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.contentMode = .scaleToFill
        
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.contentMode = .scaleToFill
        stepper.stepValue = 1
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -30),
            
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    private func addTargets() {
        stepper.addTarget(self, action: #selector(stepperAction(_:)), for: .valueChanged)
    }
    

    
    @objc func stepperAction(_ sender: UIStepper) {
        delegate?.stepperValueChanged(to: sender.value)
    }
    
    func updateLabel(with value: Double) {
        numberLabel.text = String(format: "%.f", value)
    }
    
    func getNumber() -> String? {
        return numberLabel.text
    }
}
