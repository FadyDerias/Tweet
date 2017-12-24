//
//  FollowerInformationTableViewHeader+Configuration.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

extension FollowerInformationTableViewHeader {
    
    func configureForFollower(follower: TWFollower) {
        self.userNameLabel.text = follower.name
        self.userHandleLabel.text = follower.handle
        let userPlaceHolderImage = UIImage(named: "userPlaceHolder")
        let userProfileImageUrl = URL(string: follower.profileImageUrl)
        self.userProfileImageView.sd_setImage(with: userProfileImageUrl!, placeholderImage: userPlaceHolderImage, options: .highPriority , progress: nil, completed: nil)
        let backgroundPlaceHolderImage = UIImage(named: "backgroundPlaceHolder")
        let userbackgroundImageUrl = URL(string: follower.backgroundImageUrl)
        self.userBackgroundImageView.sd_setImage(with: userbackgroundImageUrl!, placeholderImage: backgroundPlaceHolderImage, options: .highPriority , progress: nil, completed: nil)
    }
}
