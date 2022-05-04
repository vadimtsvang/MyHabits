//
//  HabitDetailsRouter.swift
//  MyHabits
//
//  Created by Vadim on 29.04.2022.
//

import UIKit

class HabitDetailsRouter {
    
    var moduleViewController: HabitDetailsViewController?
    
    func showMakeHabit(habit: Habit) {
        let vc = MakeHabitAssembly().build(habit: habit, popControllerCompletion: { [weak self] in
            self?.moduleViewController?.navigationController?.popViewController(animated: true)
        })
        moduleViewController?.present(vc, animated: true, completion: nil)
    }
}
