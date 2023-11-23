//
//  TotalController.swift
//  Tipsy
//
//  Created by macbook on 21.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class TotalController: UIViewController {
    
    init(text: Double) {
        super.init(nibName: nil, bundle: nil)
        self.totalView.updateText(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let totalView = TotalView()
    private let label = UILabel(text: "Split between 2 people with 10% tip", font: .systemFont(ofSize: 25), textColor: .lightGray)
    private let button = UIButton(title: "Recalculate", backgroundColor: .green, font: .systemFont(ofSize: 35), cornerRadius: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubviews(totalView, label, button)
        totalView.backgroundColor = UIColor(named: "lightGreen")
        label.textAlignment = .center
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        navigationItem.hidesBackButton = true
 
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            totalView.topAnchor.constraint(equalTo: view.topAnchor),
            totalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            totalView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            
            label.topAnchor.constraint(equalTo: totalView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
            
        ])
    }
    
    @objc private func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
    


}

////MARK: - SwiftUI
//import SwiftUI
//struct Provider_TotalController : PreviewProvider {
//    static var previews: some View {
//        ContainterView().edgesIgnoringSafeArea(.all)
//    }
//    
//    struct ContainterView: UIViewControllerRepresentable {
//        func makeUIViewController(context: Context) -> UIViewController {
//            return TotalController(text: 0)
//        }
//        
//        typealias UIViewControllerType = UIViewController
//        
//        
//        let viewController = TotalController(text: 0)
//        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_TotalController.ContainterView>) -> TotalController {
//            return viewController
//        }
//        
//        func updateUIViewController(_ uiViewController: Provider_TotalController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_TotalController.ContainterView>) {
//            
//        }
//    }
//    
//}

