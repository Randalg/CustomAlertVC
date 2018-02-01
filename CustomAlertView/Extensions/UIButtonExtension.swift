//
//  UIButtonExtension.swift
//  CustomAlertView
//
//  Created by MMG on 2018-02-01.
//  Copyright © 2018 MMG. All rights reserved.
//

import UIKit

extension UIButton {
    func addSidePadding(padding: CGFloat = 12) {
        self.sizeToFit()
        
        let width = self.bounds.width
        self.widthAnchor.constraint(equalToConstant: width + (2 * padding)).isActive = true
    }
}
