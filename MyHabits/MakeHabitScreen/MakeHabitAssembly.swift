//
//  MakeHabitAssembly.swift
//  MyHabits
//
//  Created by Vadim on 26.04.2022.
//

import UIKit

class MakeHabitAssembly {
    
    func build(habit: Habit?, popControllerCompletion: VoidCompletion?) -> UINavigationController {
        let router = MakeHabitRouter()
        let viewModel = MakeHabitViewModel(router: router, habit: habit, popControllerCompletion: popControllerCompletion)
        let vc = MakeHabitViewController(viewModel: viewModel)
        router.moduleViewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
}
