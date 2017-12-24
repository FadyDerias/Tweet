//
//  TWFollowersHelper.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import Foundation

class TWFollowersHelper {
    
    static let sharedInstance = TWFollowersHelper()
    private let userFollowersPath = "user_followers"
    private let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first! //Document Directory
    private let userDefaults = UserDefaults.standard
    private let lastFollowersCursorKey = "last_cursor"
    
    
    //MARK: - Followers
    
    func saveUserFollowersToDocumentsDirectory(followers: [TWFollower]) {
        let archiveUrl = documentsDirectory.appendingPathComponent(userFollowersPath)
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(followers, toFile: archiveUrl.path)
        
        if (!isSuccessfulSave) {
            print("Failed to Cache User followers")
        }
    }
    
    func retrieveUserFollowersFromDocumentsDirectory() -> [TWFollower] {
        let archiveUrl = documentsDirectory.appendingPathComponent(userFollowersPath)
        
        if let followers = NSKeyedUnarchiver.unarchiveObject(withFile: archiveUrl.path) as? [TWFollower] {
            return followers
        } else {
            let followers = [TWFollower]()
            return followers
        }
    }
    
    //MARK:- Cursor
    
    func saveLastFollowersCursorToUserDefaults(cursor: String) {
        let encodedCursor = NSKeyedArchiver.archivedData(withRootObject: cursor) //encoding the user object
        self.userDefaults.set(encodedCursor, forKey: lastFollowersCursorKey) //saving in user defaults
        self.userDefaults.synchronize() //synchronization
    }
    
    func retrieveLastFollowersCursorFromUserDefaults() -> String? {
        let decodedObject = userDefaults.object(forKey: lastFollowersCursorKey) as? Data //Retrieving the decoded object
        
        if let decodedData = decodedObject {
            let cursor = NSKeyedUnarchiver.unarchiveObject(with: decodedData) as? String
            return cursor
        } else {
            return nil
        }
    }
}
