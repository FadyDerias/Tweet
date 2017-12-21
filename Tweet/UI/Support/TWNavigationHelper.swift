//
//  TWNavigationHelper.swift
//  Tweet
//
//  Created by Fady on 12/20/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

class TWNavigationHelper {
    
    static let sharedInstance = TWNavigationHelper()
    private let appWindow = AppDelegate.getAppDelegate().window
    
    func setRootViewControllerForUserAuthentication() {
        let loginViewController = LoginViewController()
        let rootViewController = UINavigationController(rootViewController: loginViewController)
        rootViewController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        rootViewController.navigationBar.shadowImage = UIImage()
        appWindow?.rootViewController = rootViewController
    }
    
    func setRootViewControllerForSuccessfulLogin() {
        let followersViewController = FollowersTableViewController()
        let rootViewController = UINavigationController(rootViewController: followersViewController)
        appWindow?.rootViewController = rootViewController
    }
}
