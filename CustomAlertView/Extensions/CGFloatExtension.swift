//
//  CGFloatExtension.swift
//  CustomAlertView
//
//  Created by MMG on 2018-02-01.
//  Copyright © 2018 MMG. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
