//
//  UIColorExtension.swift
//  CustomAlertView
//
//  Created by MMG on 2018-02-01.
//  Copyright © 2018 MMG. All rights reserved.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
