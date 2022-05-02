//
//  HabitsViewModel.swift
//  MyHabits
//
//  Created by Vadim on 27.04.2022.
//

import UIKit

class HabitsViewModel {
    
    let router: HabitsRouter
    
    init(router: HabitsRouter) {
        self.router = router
    }
    
    func openHabitDetailsViewController(habit: Habit) {
        router.openHabitDetailsViewController(habit: habit)
    }
}
