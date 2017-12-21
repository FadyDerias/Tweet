//
//  LoginView.swift
//  Tweet
//
//  Created by Fady on 12/20/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    lazy var twitterLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "twitter_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.tw_pictonBlue, for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.tw_pictonBlue
        self.addSubview(twitterLogoImageView)
        self.addSubview(signInButton)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            twitterLogoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -64),
            twitterLogoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            twitterLogoImageView.widthAnchor.constraint(equalToConstant: 120),
            twitterLogoImageView.heightAnchor.constraint(equalToConstant: 120),
            
            signInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            signInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
