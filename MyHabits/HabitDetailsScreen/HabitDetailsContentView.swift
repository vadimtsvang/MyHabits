//
//  HabitDetailsContentView.swift
//  MyHabits
//
//  Created by Vadim on 23.04.2022.
//

import UIKit

class HabitDetailsContentView: UIView {

    let habitDetailsTableView = UITableView(frame: .zero, style: .grouped)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        habitDetailsTableView.toAutoLayout()
        habitDetailsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        habitDetailsTableView.estimatedRowHeight = 44
        habitDetailsTableView.backgroundColor = .lightGrayColor
        addSubview(habitDetailsTableView)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            habitDetailsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            habitDetailsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            habitDetailsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            habitDetailsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
