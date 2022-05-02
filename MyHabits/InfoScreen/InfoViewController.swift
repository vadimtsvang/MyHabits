//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Vadim on 07.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let infoContainerView = InfoContainerView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        view.addSubview(infoContainerView)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            infoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            infoContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            infoContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
