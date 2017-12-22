//
//  TWAuthenticationManager.swift
//  Tweet
//
//  Created by Fady on 12/22/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit
import TwitterKit

class TWAuthenticationManager {
    
    static let sharedInstance = TWAuthenticationManager()
    
    func loginUserForTwitter(viewController: UIViewController, _ success: @escaping (_ user: TWUser) -> Void, failure: @escaping (_ returnError: Error) -> Void) {
        
        Twitter.sharedInstance().logIn(with: viewController) { (twSession, error) in
            if(error != nil) {
                failure(error!)
            }
            
            if let session = twSession {
                let user = TWUser(name: session.userName, id: session.userID, authToken: session.authToken, authTokenSecret: session.authTokenSecret)
                success(user)
            }
        }
    }
    
    func logoutUser() {
        if let user = TWUsersHelper.sharedInstance.retrieveUserFromUserDefaults() {
            Twitter.sharedInstance().sessionStore.logOutUserID(user.id)
            TWUsersHelper.sharedInstance.removeUserFromUserDefaults()
        }
    }
}
