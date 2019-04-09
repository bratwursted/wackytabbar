//
//  WackTabBarController.swift
//  WackyTab
//
//  Created by Bramhall, Joe on 3/26/19.
//  Copyright © 2019 Bramhall, Joe. All rights reserved.
//

import UIKit

class WackTabBarController: UITabBarController {

    private struct ItemMetrics {
        static let compactTitleOffset = UIOffset(horizontal: 0.0, vertical: -12.0)
        static let compactIconInset = UIEdgeInsets(top: -12.0, left: 0, bottom: 0, right: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        viewControllers.map { $0.forEach({ (viewController) in
            configureTabBarItem(viewController.tabBarItem, for: traitCollection)
        })}
    }

    private func configureTabBarItem(_ tabBarItem: UITabBarItem, for traitCollection: UITraitCollection) {
        tabBarItem.titlePositionAdjustment = traitCollection.horizontalSizeClass == .regular ? .zero : ItemMetrics.compactTitleOffset
        tabBarItem.imageInsets = traitCollection.horizontalSizeClass == .regular ? .zero : ItemMetrics.compactIconInset
    }

}
