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
    
    func setRootViewControllerForUserAuthentication() {
        let appWindow = AppDelegate.getAppDelegate().window
        let loginViewController = LoginViewController()
        let rootViewController = UINavigationController(rootViewController: loginViewController)
        rootViewController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        rootViewController.navigationBar.shadowImage = UIImage()
        appWindow?.rootViewController = rootViewController
    }
}
