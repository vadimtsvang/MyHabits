//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Vadim on 15.04.2022.
//

import UIKit

import UIKit

class HabitDetailsViewController: UIViewController {
    
    private let habitDetailsContentView = HabitDetailsContentView()
    private let dataSource = HabitDetailsDataSource()
    private let viewModel: HabitDetailsViewModel
    
    init(viewModel: HabitDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureUI()
        makeBarButtonItem()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func editHabitAction() {
        viewModel.editHabit(habit: viewModel.habit)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(habitDetailsContentView)
        navigationItem.largeTitleDisplayMode = .never
        title = viewModel.habit.name
        
        dataSource.dates = viewModel.getDates()
        habitDetailsContentView.toAutoLayout()
        habitDetailsContentView.habitDetailsTableView.delegate = self
        habitDetailsContentView.habitDetailsTableView.dataSource = dataSource
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            habitDetailsContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitDetailsContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitDetailsContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitDetailsContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func makeBarButtonItem() {
        navigationController?.navigationBar.barTintColor = .materialNavigationBarColor
        let editBarButton = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(editHabitAction))
        editBarButton.tintColor = .purpleColor
        navigationItem.rightBarButtonItem = editBarButton
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        HabitDetailsHeaderView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        47.0
    }
}
