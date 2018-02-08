//
//  MGButtonFactory.swift
//  CustomAlertView
//
//  Created by MMG on 2018-02-08.
//  Copyright © 2018 MMG. All rights reserved.
//

import UIKit

class MGButtonFactory {
    private class func createButton(title: String, titleColor: UIColor = .lightGray, onTap: (() -> ())?) -> UIButton {
        let button = MGButton(onTap: onTap)
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 19)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.layer.borderColor = titleColor.cgColor

        
        return button
    }
    
    private class func createColorButton(title: String, resizable: Bool, width: CGFloat = 88, height: CGFloat = 36, buttonColor: UIColor = .red, titleColor: UIColor = .white, onTap: (() -> ())?) -> UIButton {
        let button = resizable ? createButton(title: title, titleColor: titleColor, onTap: onTap) : getButton(title: title, width: width, height: height, onTap: onTap)
        button.setTitleColor(titleColor, for: .normal)
        button.layer.backgroundColor = buttonColor.cgColor
        button.layer.borderColor = buttonColor.cgColor
        
        return button
    }
    
    class func getButton(title: String, width: CGFloat = 88, height: CGFloat = 36, titleColor: UIColor = .lightGray, onTap: (() -> ())?) -> UIButton {
        let button = createButton(title: title, titleColor: titleColor, onTap: onTap)
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return button
    }
    
    class func getResizableButton(title: String, titleColor: UIColor = .lightGray, onTap: (() -> ())?) -> UIButton {
        let button = createButton(title: title, titleColor: titleColor, onTap: onTap)
        button.addSidePadding()
        
        return button
    }
    
    class func getColorButton(title: String, width: CGFloat = 88, height: CGFloat = 36, buttonColor: UIColor = .red, titleColor: UIColor = .white, onTap: (() -> ())?) -> UIButton {
        return createColorButton(title: title, resizable: false, width: width, height: height, buttonColor: buttonColor, titleColor: titleColor, onTap: onTap)
    }
    
    class func getResizableColorButton(title: String, buttonColor: UIColor = .red, titleColor: UIColor = .white, onTap: (() -> ())?) -> UIButton {
        let button = createColorButton(title: title, resizable: true, buttonColor: buttonColor, titleColor: titleColor, onTap: onTap)
        button.addSidePadding()
        
        return button
    }
    
    class func getBottomScreenwideButton(title: String, inParentView view: UIView, buttonColor: UIColor = .red, titleColor: UIColor = .white, onTap: (() -> ())?) -> UIButton {
        let buttonHeight: CGFloat = 50
        let button = MGButton(onTap: onTap!)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = buttonColor
        button.tintColor = titleColor
        button.setTitle(title, for: .normal)
        view.addSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.leftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.safeRightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
        
        return button
    }
}
