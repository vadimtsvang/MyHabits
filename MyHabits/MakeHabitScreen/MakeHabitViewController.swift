//
//  MakeHabitViewController.swift
//  MyHabits
//
//  Created by Vadim on 23.04.2022.
//

import UIKit

class MakeHabitViewController: UIViewController {
    
    private let makeHabitContentView = MakeHabitContentView()
    private let viewModel: MakeHabitViewModel
    private var selectedColor: UIColor?
    
    init(viewModel: MakeHabitViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureUI()
        configureLayout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveHabitAction() {
        guard let color = selectedColor, let name = makeHabitContentView.getHabitName() else { return }
        let habit = Habit(name: name, date: makeHabitContentView.getHabitDate(), color: color)
        viewModel.saveHabit(habit: habit)
    }
    
    private func bind() {
        makeHabitContentView.deleteHabit = { [weak self] in
            self?.viewModel.makeAlertController()
        }
        
        makeHabitContentView.colorPicker = { [weak self] in
            self?.viewModel.makeColorPicker()
        }
        
        makeHabitContentView.setup(habit: viewModel.habit)
    }
    
    private func configureUI() {
        //view.backgroundColor = .white
        view.addSubview(makeHabitContentView)
        navigationController?.navigationBar.barTintColor = .materialNavigationBarColor
        let saveBarButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabitAction))
        let cancelBarButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelButton))
        saveBarButton.tintColor = .purpleColor
        cancelBarButton.tintColor = .purpleColor
        navigationItem.rightBarButtonItem = saveBarButton
        navigationItem.leftBarButtonItem = cancelBarButton
        title = "Создать"
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            makeHabitContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            makeHabitContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            makeHabitContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            makeHabitContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MakeHabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        makeHabitContentView.setColor(color: viewController.selectedColor)
        selectedColor = viewController.selectedColor
    }
}
