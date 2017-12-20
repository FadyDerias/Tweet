//
//  ViewController.swift
//  Tweet
//
//  Created by Fady on 12/20/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    var loginView: LoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView = LoginView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        loginView.signInButton.addTarget(self, action: #selector(loginUserViaTwitter), for: .touchUpInside)
        self.view.addSubview(loginView)
    }
    
    @objc func loginUserViaTwitter() {
        print("User Logging in via twitter .. ")
    }
}

