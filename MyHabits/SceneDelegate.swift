//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Vadim on 07.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .purple
        
        let habitsVC = HabitsAssembly().build()
        habitsVC.view.backgroundColor = .white
        habitsVC.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "habbits"), tag: 0)
        
        let infoVC = InfoViewController()
        infoVC.view.backgroundColor = .white
        infoVC.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(named: "info"), tag: 1)
        
        let habitsNC = UINavigationController(rootViewController: habitsVC)
        habitsNC.navigationBar.prefersLargeTitles = true
        habitsNC.navigationBar.topItem?.title = "Сегодня"
        
        let infoNC = UINavigationController(rootViewController: infoVC)
        infoNC.navigationBar.topItem?.title = "Информация"
        tabBarController.viewControllers = [habitsNC, infoNC]
        
        window?.rootViewController = tabBarController
    }


}

