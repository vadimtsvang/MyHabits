//
//  MakeHabitViewModel.swift
//  MyHabits
//
//  Created by Vadim on 26.04.2022.
//

import UIKit

class MakeHabitViewModel {
    
    let router: MakeHabitRouter
    var habit: Habit?
    var popControllerCompletion: VoidCompletion?
    
    init(router: MakeHabitRouter, habit: Habit?, popControllerCompletion: VoidCompletion?) {
        self.router = router
        self.habit = habit
        self.popControllerCompletion = popControllerCompletion
    }
    
    func makeAlertController() {
        router.makeAlertController { [weak self] in
            if let habit = self?.habit, let index = HabitsStore.shared.habits.firstIndex(of: habit) {
                HabitsStore.shared.habits.remove(at: index)
                self?.popControllerCompletion?()
                self?.router.dismissScreen()
            }
        }
    }
    
    func makeColorPicker() {
        router.makeColorPicker(selectedColor: habit?.color)
    }
    
    func saveHabit(habit: Habit) {
        HabitsStore.shared.habits.append(habit)
        router.dismissScreen()
    }
}
