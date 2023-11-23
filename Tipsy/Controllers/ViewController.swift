//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private let enterView = EnterBillView()
    private let tipsView = TipsView()
    private let splitView = SplitView()
    private let calculateButton = UIButton(title: "Calculate", backgroundColor: .green, font: .systemFont(ofSize: 35), cornerRadius: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        addTargets()
        tipsView.onTipSelected = { [weak self] tipPercentage in
                // Вызовите метод для обновления расчетов или интерфейса
                self?.calculate(tips: tipPercentage)
            }
    }
    
    private func setupView() {
        view.addSubviews(enterView, tipsView, splitView, calculateButton)
        view.safeAreaLayoutGuide.owningView?.backgroundColor = UIColor(named: "lightGreen")
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            enterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            enterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            enterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tipsView.topAnchor.constraint(equalTo: enterView.bottomAnchor, constant: 40),
            tipsView.leadingAnchor.constraint(equalTo: enterView.leadingAnchor),
            tipsView.trailingAnchor.constraint(equalTo: enterView.trailingAnchor),
            tipsView.heightAnchor.constraint(equalToConstant: 150),
            
            splitView.topAnchor.constraint(equalTo: tipsView.bottomAnchor),
            splitView.leadingAnchor.constraint(equalTo: tipsView.leadingAnchor),
            splitView.trailingAnchor.constraint(equalTo: tipsView.trailingAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
    }
    
    private func addTargets() {
//        tipsView.zeroAction(self, action: #selector(buttonTapped(_:)))
//        tipsView.tenAction(self, action: #selector(buttonTapped(_:)))
//        tipsView.twentyAction(self, action: #selector(buttonTapped(_:)))
        splitView.delegate = self
        
        calculateButton.addTarget(self, action: #selector(calculateAction), for: .touchUpInside)
    }
    
    @objc private func calculateAction() {

        let calculate = calculate(tips: getCurrentTip())
        print("GetCurrentTip ---> ", getCurrentTip())
        let vc = TotalController(text: calculate)
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc private func buttonTapped(_ sender: UIButton) {
//        enterView.endEditing()
//        var value: Double = 0
//        sender.isSelected = !sender.isSelected
//        switch sender.tag {
//        case 0: value = 0.0
//        case 1: value = 0.10
//        case 2: value = 0.20
//        default: return
//        }
//    }
    
    private func getCurrentTip() -> Double {
//        print("tipsView--->", tipsView.getCurrentTipPercentage())
        return tipsView.getCurrentTipPercentage()

    }
    
    private func calculate(tips: Double) -> Double {
        guard let billAmountText = enterView.getText(),
              let billAmount = Double(billAmountText),
              let numberOfPeopleText = splitView.getNumber(),
              let numberOfPeople = Double(numberOfPeopleText) else {
            return 0
        }
        print("BillAmount --->", billAmount)
        print("numberOfPeople --->", numberOfPeople)
        let totalAmount = billAmount * (1 + tips)
        let amountPerPerson = totalAmount / numberOfPeople
        print(amountPerPerson)
        
        return amountPerPerson
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension ViewController: SplitViewDelegate {
    func stepperValueChanged(to newValue: Double) {
        splitView.updateLabel(with: newValue)
    }

}




//MARK: - SwiftUI
import SwiftUI
struct Provider_ViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return ViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = ViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) -> ViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_ViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) {
            
        }
    }
    
}

