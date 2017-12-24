//
//  UIAlertController+Networking.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func defaultNetworkingErrorAlertController(_ retryHandler: @escaping (() -> Void)) -> UIAlertController {
        let alertController = UIAlertController(title: "Networking Error".localized,
                                                message: "No internet connection, would you like to try again?".localized,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let retryAction = UIAlertAction(title: "Retry".localized, style: .default) { (alertController) in
            retryHandler()
        }
        
        alertController.addAction(retryAction)
        
        return alertController
    }
    
    static func confirmLogoutAlertController(_ yesHandler: @escaping (() -> Void)) -> UIAlertController {
        let alertController = UIAlertController(title: "Alert".localized,
                                                message: "Are you sure you wanted to logout?".localized,
                                                preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No".localized, style: .cancel, handler: nil)
        alertController.addAction(noAction)
        
        let yesAction = UIAlertAction(title: "Yes".localized, style: .default) { (alertController) in
            yesHandler()
        }
        
        alertController.addAction(yesAction)
        
        return alertController
    }
}
