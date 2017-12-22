//
//  AppDelegate.swift
//  Tweet
//
//  Created by Fady on 12/20/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Application does not support story boards, and is all programmatic
        //Setting the window frame
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        setupAppearance()
        TWNavigationHelper.sharedInstance.setRootViewControllerForUserAuthentication()
        return true
    }
    
    //Function that returns the app delegate instance
    class func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func setupAppearance() {
        self.window?.backgroundColor = UIColor.white //Modifying window background color
        //Customizing view of SVProgressHUD
        SVProgressHUD.setForegroundColor(UIColor.tw_pictonBlue)
        SVProgressHUD.setBackgroundColor(UIColor.darkGray)
        SVProgressHUD.setRingThickness(4)
        
        //Customization of app's navigation bar
        UINavigationBar.appearance().tintColor = UIColor.tw_pictonBlue
    }
}

