//
//  ViewController.swift
//  CustomAlertView
//
//  Created by MMG on 2018-02-01.
//  Copyright © 2018 MMG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.backgroundColor = .lightGray
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    var wideButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        initBottomWideButton(withTitle: "Change Color")
        stackView.addArrangedSubview(getDeleteAlertButton())
        stackView.addArrangedSubview(getNotSharableAlertButton())

        view.addSubview(stackView)
        autoLayout()
    }
    
    func autoLayout(){
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func initBottomWideButton(withTitle title: String){
        wideButton = MGButtonFactory.getBottomScreenwideButton(title: title, inParentView: self.view, onTap: rockIt)
    }
    
    func getDeleteAlertButton() -> UIButton{
        let button = MGButtonFactory.getResizableColorButton(title: "Delete", onTap: showDeleteAlert)
        
        return button
    }

    @objc func showDeleteAlert(){
        let cancelButton = MGButtonFactory.getButton(title: "Cancel", onTap: nil)
        let deleteButton = MGButtonFactory.getColorButton(title: "Delete", onTap: {
            print("VC - Delete Button Pressed!!!")
        })
        let alert = MGAlertView(title: "Are you sure you want to delete this item?", body: nil, buttons: [cancelButton, deleteButton], image: nil)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func getNotSharableAlertButton() -> UIButton{
        let button = MGButtonFactory.getResizableColorButton(title: "Not Sharable", onTap: showNotSharableAlert)
        
        return button
    }
    
    @objc func showNotSharableAlert(){
        let closeButton = MGButtonFactory.getColorButton(title: "Close", onTap: closeTapped)
        let alert = MGAlertView(title: "This item is not sharable.", body: nil, buttons: [closeButton], image: #imageLiteral(resourceName: "ic_lock_48pt"))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    @objc private func cancelTapped(){
        print("VC - Cancel Button Pressed!!!")
    }
    
    @objc private func deleteTapped(){
        print("VC - Delete Button Pressed!!!")
    }
    
    @objc private func closeTapped(){
        print("VC - Close Button Pressed!!!")
    }
    
    @objc private func okTapped(){
        print("VC - OK Button Pressed!!!")
    }
    
    @objc private func rockIt(){
        wideButton?.backgroundColor = UIColor.random()
        wideButton?.setTitleColor(UIColor.random(), for: .normal)
    }
}
