//
//  RootFlowCoordinator.swift
//  WackyTab
//
//  Created by Bramhall, Joe on 4/9/19.
//  Copyright © 2019 Bramhall, Joe. All rights reserved.
//

import Foundation
import UIKit

class RootFlowCoordinator: NSObject {

    var rootTabBarController: WackTabBarController?

    func presentRootInterface(on window: UIWindow) {
        rootTabBarController = makeRootTabBarController()
        rootTabBarController.map(configureTabBarController(_:))
        window.rootViewController = rootTabBarController
        window.makeKeyAndVisible()
    }

    private func configureTabBarController(_ tabBarController: UITabBarController) {

        let topStories = UINavigationController(rootViewController: FirstViewController())
        topStories.tabBarItem = UITabBarItem(title: "Top Stories", image: UIImage(named: "superT"), selectedImage: nil)

        let forYou = UINavigationController(rootViewController: SecondViewController())
        forYou.tabBarItem = UITabBarItem(title: "For You", image: UIImage(named: "star"), selectedImage: nil)

        tabBarController.setViewControllers([topStories, forYou], animated: false)

        tabBarController.tabBar.isTranslucent = true
    }

    private func makeRootTabBarController() -> WackTabBarController? {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "WackTabBarController")
        guard let tabBarController = rootViewController as? WackTabBarController else {
            assertionFailure("Expecting a UITabBarController")
            return nil
        }

        return tabBarController
    }
}
