//
//  HabitDetailsHeaderView.swift
//  MyHabits
//
//  Created by Vadim on 23.04.2022.
//

import UIKit

class HabitDetailsHeaderView: UIView {

    private var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Regular", size: 13)
        view.text = activity.uppercased()
        view.tintColor = .tableSectionHeaderTextColor
        view.toAutoLayout()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(titleLabel)
        backgroundColor = .lightGrayColor
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)            
        ])
    }
}
