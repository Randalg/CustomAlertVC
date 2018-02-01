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
        initBottomWideButton(withTitle: "Cool")
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
        wideButton = QSButton.getBottomScreenwideButton(title: title, view: self.view)
        wideButton?.addTarget(self, action: #selector(rockIt), for: .touchUpInside)
    }
    
    func getDeleteAlertButton() -> UIButton{
        let button = QSButton.getResizableColorButton(title: "Show Delete Dialog")
        button.addTarget(self, action: #selector(showDeleteAlert), for: .touchUpInside)
        
        return button
    }

    @objc func showDeleteAlert(){
        let deleteButton = QSButton.getColorButton(title: "Delete")
        deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        let cancelButton = QSButton.getButton(title: "Cancel")
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        
        let alert = MyAlertView(title: "Are you sure you want to delete this item?", body: "Selected item will no longer appear in your list?", buttons: [cancelButton, deleteButton], image: nil)
        
        alert.modalPresentationStyle = .overCurrentContext
        alert.modalTransitionStyle = .crossDissolve
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func getNotSharableAlertButton() -> UIButton{
        let button = QSButton.getResizableColorButton(title: "Show Not Sharable Dialog")
        button.addTarget(self, action: #selector(showNotSharableAlert), for: .touchUpInside)
        
        return button
    }
    
    @objc func showNotSharableAlert(){
        let closeButton = QSButton.getColorButton(title: "Close")
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        let alert = MyAlertView(title: "This item is not sharable.", body: nil, buttons: [closeButton], image: #imageLiteral(resourceName: "ic_lock_48pt"))
        
        alert.modalPresentationStyle = .overCurrentContext
        alert.modalTransitionStyle = .crossDissolve
        
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
        print("The Red Moon ROCKS!!!")
    }
}

