//
//  MakeHabitContentView.swift
//  MyHabits
//
//  Created by Vadim on 23.04.2022.
//

import UIKit

class MakeHabitContentView: UIView {
    
    var deleteHabit: VoidCompletion?
    var colorPicker: VoidCompletion?
    
    private var nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Semibold", size: 13)
        view.text = name.uppercased()
        view.textColor = .black
        return view
    }()
    
    private var habitTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.font = UIFont(name: "SFProText-Regular", size: 17)
        textField.tintColor = .systemGray2Color
        return textField
    }()
    
    private var colorNameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Semibold", size: 13)
        view.text = color.uppercased()
        view.textColor = .black
        return view
    }()
    
    private var colorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(colorPickerAction), for: .touchUpInside)
        return button
    }()
    
    private var timeNameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Semibold", size: 13)
        view.text = time.uppercased()
        view.textColor = .black
        return view
    }()
    
    private var titleTimeLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Regular", size: 17)
        view.text = "Каждый день в "
        view.textColor = .black
        return view
    }()
    
    private var selectTimeLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Regular", size: 17)
        view.textColor = .purpleColor
        return view
    }()
    
    private var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.locale = .current
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.sizeToFit()
        }
        return datePicker
    }()
    
    private var deleteHabitButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.backgroundColor = .white
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(UIColor.deleteButtonColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Regular", size: 17)
        button.addTarget(self, action: #selector(deleteHabitAction), for: .touchUpInside)
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
    
    func setup(habit: Habit?) {
        guard let habit = habit else { return }
        habitTextField.text = habit.name
        colorButton.backgroundColor = habit.color
        datePicker.date = habit.date
        selectTimeLabel.text = habit.dateString
        deleteHabitButton.isHidden = false
    }
    
    func setColor(color: UIColor) {
        colorButton.backgroundColor = color
    }
    
    func getHabitName() -> String? {
        habitTextField.text
    }
    
    func getHabitDate() -> Date {
        datePicker.date
    }
    
    private func configureUI() {
        [
            nameLabel, habitTextField, colorNameLabel, colorButton, timeNameLabel, selectTimeLabel, titleTimeLabel, datePicker, deleteHabitButton
        ].forEach {
            addSubview($0)
            $0.toAutoLayout()
        }
        backgroundColor = .white
        toAutoLayout()

    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            habitTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            habitTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            habitTextField.heightAnchor.constraint(equalToConstant: 22),
            
            colorNameLabel.topAnchor.constraint(equalTo: habitTextField.bottomAnchor, constant: 15),
            colorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            colorButton.topAnchor.constraint(equalTo: colorNameLabel.bottomAnchor, constant: 7),
            colorButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            
            timeNameLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            titleTimeLabel.topAnchor.constraint(equalTo: timeNameLabel.bottomAnchor, constant: 7),
            titleTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            selectTimeLabel.centerYAnchor.constraint(equalTo: titleTimeLabel.centerYAnchor),
            selectTimeLabel.leadingAnchor.constraint(equalTo: titleTimeLabel.trailingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: selectTimeLabel.bottomAnchor, constant: 15),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            datePicker.heightAnchor.constraint(equalToConstant: 216),
            
            deleteHabitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -18),
            deleteHabitButton.heightAnchor.constraint(equalToConstant: 22),
            deleteHabitButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date: String = dateFormatter.string(from: datePicker.date)
        selectTimeLabel.text = date
    }
    
    @objc func colorPickerAction() {
        colorPicker?()
    }
    
    @objc func deleteHabitAction() {
        deleteHabit?()
    }
}


