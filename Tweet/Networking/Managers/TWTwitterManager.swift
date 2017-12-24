//
//  TWTwitterManager.swift
//  Tweet
//
//  Created by Fady on 12/22/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import Foundation
import Swifter
import Mapper

class TWTwitterManager {
    
    static let sharedInstance = TWTwitterManager()
    private let swifter = Swifter(consumerKey: TwitterKeys.consumerKey, consumerSecret: TwitterKeys.consumerSecret)
    let user = TWUsersHelper.sharedInstance.retrieveUserFromUserDefaults()!
    
    func getUserFollowers(cursor: String, _ success: @escaping (_ followers: [TWFollower],_ nextCursor: String) -> Void, failure: @escaping (_ returnError: Error) -> Void) {
        swifter.getUserFollowers(for: .id(user.id) , cursor: cursor, count: 10, skipStatus: false, includeUserEntities: false, success: { (json, previousCursor, nextCursor) in
            
            if let jsonArray = String.convertJsonToArray(json: json) {
                let followers = TWFollower.from(jsonArray)
                success(followers!, nextCursor!)
            }
        }) { (error) in
            failure(error)
        }
    }
    
    func getTweetsForUser(userId: String, _ success: @escaping (_ tweets: [Tweet]) -> Void, failure: @escaping (_ returnError: Error) -> Void) {
        swifter.getTimeline(for: userId, count: 10, sinceID: nil, maxID: nil, trimUser: false, contributorDetails: false, includeEntities: false, tweetMode: .extended, success: { (json) in
            if let jsonArray = String.convertJsonToArray(json: json) {
                let tweets = Tweet.from(jsonArray)
                success(tweets!)
            }
        }) { (error) in
            failure(error)
        }
    }
}
