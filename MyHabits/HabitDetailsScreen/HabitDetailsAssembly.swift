//
//  HabitDetailsAssembly.swift
//  MyHabits
//
//  Created by Vadim on 29.04.2022.
//

import UIKit

class HabitDetailsAssembly {
    
    func build(habit: Habit) -> UIViewController {
        let router = HabitDetailsRouter()
        let viewModel = HabitDetailsViewModel(router: router, habit: habit)
        let vc = HabitDetailsViewController(viewModel: viewModel)
        router.moduleViewController = vc
        return vc
    }
}
