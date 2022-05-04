//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Vadim on 14.04.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    var checkHabitCompletion: VoidCompletion?
    private var habit: Habit?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        contentView.addSubview(view)
        view.layer.cornerRadius = 8
        view.toAutoLayout()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "SFProText-Semibold", size: 17)
        label.textColor = .indigoColor
        return label
        
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 12)
        label.textColor = .systemGray2Color
        return label
        
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 13)
        label.textColor = .systemGrayColor
        return label
        
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 19
        button.addTarget(self, action: #selector(checkHabitAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(habit: Habit) {
        self.habit = habit
        titleLabel.text = habit.name
        titleLabel.textColor = habit.color
        descriptionLabel.text = "Каждый день в \(habit.dateString)"
        counterLabel.text = "Счётчик: \(habit.trackDates.count)"
        checkButton.layer.borderColor = habit.color.cgColor
        
        let isTracking = HabitsStore.shared.habit(habit, isTrackedIn: Date())
        checkButton.backgroundColor = isTracking ? habit.color : .clear
        
        let image = isTracking ? UIImage(named: "checkBox") : nil
        checkButton.setImage(image, for: .normal)
    }
    
    @objc private func checkHabitAction() {
        guard let habit = habit, !HabitsStore.shared.habit(habit, isTrackedIn: Date()) else { return }
        HabitsStore.shared.track(habit)
        checkHabitCompletion?()
    }
    
    private func configureUI() {
        contentView.backgroundColor = .lightGrayColor
        [titleLabel, descriptionLabel, counterLabel, checkButton].forEach {
            containerView.addSubview($0)
            $0.toAutoLayout()
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -6),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -103),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -103),
            
            counterLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            counterLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            counterLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -103),
            
            checkButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            checkButton.heightAnchor.constraint(equalToConstant: 38),
            checkButton.widthAnchor.constraint(equalToConstant: 38),
            checkButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
    }
}
