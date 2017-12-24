//
//  FollowerTableViewCell+Configuration.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

extension FollowerTableViewCell {
    
    func configureForFollower(follower: TWFollower) {
        self.userNameLabel.text = follower.name
        self.userHandleLabel.text = follower.handle
        self.userBioLabel.text = follower.bio
        let url = URL(string: follower.profileImageUrl)
        let placeHolderImage = UIImage(named: "userPlaceHolder")
        self.userAvatarImageView.sd_setImage(with: url!, placeholderImage: placeHolderImage, options: .highPriority , progress: nil, completed: nil)
    }
}
