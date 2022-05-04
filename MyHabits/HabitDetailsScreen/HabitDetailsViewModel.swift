//
//  HabitDetailsViewModel.swift
//  MyHabits
//
//  Created by Vadim on 29.04.2022.
//

import UIKit

class HabitDetailsViewModel {
    
    let router: HabitDetailsRouter
    let habit: Habit
    
    init(router: HabitDetailsRouter, habit: Habit) {
        self.router = router
        self.habit = habit
    }
    
    func getDates() -> [Date] {
        habit.trackDates
    }
    
    func editHabit(habit: Habit) {
        router.showMakeHabit(habit: habit)
    }
}
