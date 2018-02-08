//
//  QSButton.swift
//  CustomAlertView
//
//  Created by MMG on 2018-01-31.
//  Copyright © 2018 MMG. All rights reserved.
//

import UIKit

final class MGButton: UIButton {
    var onTap: (() -> ())?
    
    init(onTap: (() -> ())?) {
        self.onTap = onTap
        super.init(frame: .zero)
        
        if self.onTap != nil {
            addTarget(self, action: #selector(tapped), for: .touchUpInside)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(sender: AnyObject) {
        onTap?()
    }
}
