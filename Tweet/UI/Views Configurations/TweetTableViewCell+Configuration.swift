//
//  TweetTableViewCell+Configuration.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

extension TweetTableViewCell {
    
    func configureTweetForUser(tweet:Tweet, follower: TWFollower) {
        self.userNameLabel.text = follower.name
        self.userHandleLabel.text = follower.handle
        self.userTweetLabel.text = tweet.fullText
    }
}

