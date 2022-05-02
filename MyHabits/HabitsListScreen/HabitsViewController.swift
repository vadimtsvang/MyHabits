//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Vadim on 07.04.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private let habitsContentView = HabitsContentView()
    private let dataSource = HabitsDataSource()
    private let viewModel: HabitsViewModel
    
    init(viewModel: HabitsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bind()
    }
    
    private func bind() {
        dataSource.habits = HabitsStore.shared.habits
        habitsContentView.habitsListCollectionView.reloadData()
    }
    
    private func configureUI() {
        view.addSubviews(habitsContentView)
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationItem.rightBarButtonItem = barButton
        barButton.tintColor = .purple
    }
    
    private func configureLayout() {
        habitsContentView.toAutoLayout()
        habitsContentView.habitsListCollectionView.delegate = self
        habitsContentView.habitsListCollectionView.dataSource = dataSource
        
        NSLayoutConstraint.activate([
            habitsContentView.habitsListCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitsContentView.habitsListCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitsContentView.habitsListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitsContentView.habitsListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func addHabit() {
        let vc = MakeHabitAssembly().build(habit: nil, popControllerCompletion: nil)
        present(vc, animated: true, completion: nil)
    }
}

extension HabitsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let habit = dataSource.habits[indexPath.item]
        viewModel.openHabitDetailsViewController(habit: habit)
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let sections = HabitsDataSource.Sections(rawValue: indexPath.section) else { return .zero }
        switch sections {
        case .progress:
            return CGSize(width: collectionView.frame.width, height: 85)
        case .habit:
            return CGSize(width: collectionView.frame.width, height: 142)
        }
    }
}
