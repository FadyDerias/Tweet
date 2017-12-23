//
//  ViewController.swift
//  Tweet
//
//  Created by Fady on 12/20/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewsForViewController()
    }
    
    @objc func loginUserViaTwitter() {
        TWAuthenticationManager.sharedInstance.loginUserForTwitter(viewController: self, { (user) in
            TWUsersHelper.sharedInstance.saveAuthenticatedUserToUserDefaults(user: user)
            TWNavigationHelper.sharedInstance.setRootViewControllerForSuccessfulLogin()
        }) { (error) in
            //Present Failure Alert Controller
        }
    }
    
    //MARK:- Support
    
    func addViewsForViewController() {
        loginView = LoginView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        loginView.signInButton.addTarget(self, action: #selector(loginUserViaTwitter), for: .touchUpInside)
        self.view.addSubview(loginView)
    }
}
