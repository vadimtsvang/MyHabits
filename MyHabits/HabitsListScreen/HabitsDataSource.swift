//
//  HabitsDataSource.swift
//  MyHabits
//
//  Created by Vadim on 14.04.2022.
//

import UIKit

class HabitsDataSource: NSObject {
    
    enum Sections: Int, CaseIterable {
        case progress, habit
    }
    
    var habits = [Habit]()
}

extension HabitsDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Sections.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sections = Sections(rawValue: section) else { return .zero }
        switch sections {
        case .progress:
            return 1
        case .habit:
            return habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sections = Sections(rawValue: indexPath.section) else { return UICollectionViewCell() }
        switch sections {
        case .progress:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCollectionViewCell", for: indexPath) as!
            ProgressCollectionViewCell
            cell.setup(HabitsStore.shared.todayProgress)
            return cell
        case .habit:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HabitCollectionViewCell", for: indexPath) as! HabitCollectionViewCell
            cell.checkHabitCompletion = {
                collectionView.reloadData()
            }
            cell.setup(habit: habits[indexPath.item])
            return cell
        }
    }
}
