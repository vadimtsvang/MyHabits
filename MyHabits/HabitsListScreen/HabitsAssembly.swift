//
//  HabitsAssembly.swift
//  MyHabits
//
//  Created by Vadim on 27.04.2022.
//

import UIKit

class HabitsAssembly {
    
    func build() -> UIViewController {
        let router = HabitsRouter()
        let viewModel = HabitsViewModel(router: router)
        let vc = HabitsViewController(viewModel: viewModel)
        router.moduleViewController = vc
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
}
