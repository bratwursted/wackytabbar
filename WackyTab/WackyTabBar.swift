//
//  WackyTabBar.swift
//  WackyTab
//
//  Created by Bramhall, Joe on 4/9/19.
//  Copyright © 2019 Bramhall, Joe. All rights reserved.
//

import UIKit

class WackyTabBar: UITabBar {

    private struct LayoutMetrics {
        static let heightOffset: CGFloat = 11.0
    }

    override func sizeThatFits(_ aSize: CGSize) -> CGSize {
        var size = super.sizeThatFits(aSize)
        size.height += LayoutMetrics.heightOffset
        return size
    }
}
