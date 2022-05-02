//
//  HabitsRouter.swift
//  MyHabits
//
//  Created by Vadim on 27.04.2022.
//

import UIKit

class HabitsRouter {
    
    var moduleViewController: HabitsViewController?
    
    func openHabitDetailsViewController(habit: Habit) {
        let vc = HabitDetailsAssembly().build(habit: habit)
        moduleViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
