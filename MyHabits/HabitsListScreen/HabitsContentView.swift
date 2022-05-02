//
//  HabitsContentView.swift
//  MyHabits
//
//  Created by Vadim on 14.04.2022.
//

import UIKit

class HabitsContentView: UIView {
    
    var habitsListCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        
        habitsListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        habitsListCollectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: "ProgressCollectionViewCell")
        habitsListCollectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: "HabitCollectionViewCell")
        habitsListCollectionView.showsVerticalScrollIndicator = false
        habitsListCollectionView.backgroundColor = .lightGrayColor
        habitsListCollectionView.contentInset = UIEdgeInsets(top: .zero, left: 20, bottom: .zero, right: 20)
        habitsListCollectionView.toAutoLayout()
        addSubview(habitsListCollectionView ?? UICollectionView())
    }
    
    func configureLayout() {
        NSLayoutConstraint.activate([
            habitsListCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            habitsListCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            habitsListCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            habitsListCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
