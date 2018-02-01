//
//  MyAlertView.swift
//  CustomAlertView
//
//  Created by MMG on 2018-01-30.
//  Copyright © 2018 dluque. All rights reserved.
//

import UIKit

class MyAlertView: UIViewController {
    
    var backgroungView: UIView = {
        let menuView = UIView()
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.layer.cornerRadius = 16
        menuView.backgroundColor = UIColor.white
        
        return menuView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 72, height: 72))
        imageView.image = nil
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.sizeToFit()
        label.textAlignment = .center
        
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        label.sizeToFit()
        label.textAlignment = .center
        
        return label
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.backgroundColor = .white
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.backgroundColor = .white
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    var buttons: [UIButton]?
    
    convenience init() {
        self.init(title: nil, body: nil, buttons: nil, image: nil)
    }
    
    init(title: String?, body: String?, buttons: [UIButton]?, image: UIImage? = nil) {
        if let title = title {
            titleLabel.text = title
        }
        
        if let body = body {
            self.messageLabel.text = body
        }
        
        if let image = image {
            let renderedImage = image.withRenderingMode(.alwaysTemplate)
            self.imageView.image = renderedImage
        }
        
        if let buttons = buttons {
            self.buttons = buttons
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroungView)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutViews()
    }
    
    func setUpViews() {
        if imageView.image != nil {
            mainStackView.addArrangedSubview(imageView)
        }
        
        if titleLabel.text != nil {
            mainStackView.addArrangedSubview(titleLabel)
        }
        
        if messageLabel.text != nil {
            mainStackView.addArrangedSubview(messageLabel)
        }
        
        if let buttons = buttons {
            for button in buttons {
                button.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
                buttonStackView.addArrangedSubview(button)
            }
            
            buttonStackView.layoutMargins = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
            buttonStackView.isLayoutMarginsRelativeArrangement = true
            
            mainStackView.addArrangedSubview(buttonStackView)
        }
    }
    
    func layoutViews() {
        view.addSubview(mainStackView)
        autoLayout()
    }
    
    func autoLayout(){
        let contentOffsetFromView: CGFloat =  32

        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.widthAnchor.constraint(lessThanOrEqualToConstant: 272).isActive = true
        
        if imageView.image != nil {
            imageView.widthAnchor.constraint(equalToConstant: 72).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        }
        
        backgroungView.leftAnchor.constraint(equalTo: mainStackView.leftAnchor, constant: -contentOffsetFromView).isActive = true
        backgroungView.rightAnchor.constraint(equalTo: mainStackView.rightAnchor, constant: contentOffsetFromView).isActive = true
        backgroungView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -contentOffsetFromView).isActive = true
        backgroungView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: contentOffsetFromView).isActive = true
    }
    
    func dissmissViewController(){
        self.dismiss(animated: true, completion: nil)
    }
}
