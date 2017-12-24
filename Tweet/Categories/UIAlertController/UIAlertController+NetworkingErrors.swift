//
//  UIAlertController+NetworkingErrors.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func defaultNetworkingAlertController(_ retryHandler: @escaping (() -> Void)) -> UIAlertController {
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
}
