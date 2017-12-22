//
//  TWUsersHelper.swift
//  Tweet
//
//  Created by Fady on 12/22/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import Foundation
import TwitterKit

class TWUsersHelper {
    
    static let sharedInstance = TWUsersHelper()
    private let userDefaults = UserDefaults.standard // standard user defaults
    private let authenticatedUserKey = "authenticatedUserKey" //Key to save/cache the authenticated user object after successful sign in process in the user defaults
    
    //MARK:- User Defaults

    //Function that saves the user object to the user defaults.
    func saveAuthenticatedUserToUserDefaults(user: TWUser) {
        let encodedUser = NSKeyedArchiver.archivedData(withRootObject: user) //encoding the user object
        self.userDefaults.set(encodedUser, forKey: authenticatedUserKey) //saving in user defaults
        self.userDefaults.synchronize() //synchronization
    }
    
    //Function that retrieves the user object from the user defaults
    func retrieveUserFromUserDefaults() -> TWUser? {
        let decodedObject = userDefaults.object(forKey: authenticatedUserKey) as? Data //Retrieving the decoded object
        
        if let decodedData = decodedObject {
            let user = NSKeyedUnarchiver.unarchiveObject(with: decodedData) as? TWUser //unarchiving the decoded object to a user object.
            return user //returning the user object.
        } else {
            return nil
        }
    }
    
    //Function that removes the user from the user defaults
    func removeUserFromUserDefaults() {
        self.userDefaults.removeObject(forKey: authenticatedUserKey)
    }
}
