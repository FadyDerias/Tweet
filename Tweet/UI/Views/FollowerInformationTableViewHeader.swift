//
//  FollowerInformationTableViewHeader.swift
//  Tweet
//
//  Created by Fady on 12/21/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

class FollowerInformationTableViewHeader: UITableViewHeaderFooterView {
    
    lazy var userBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.decideTextAlignment()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userHandleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(15)
        label.textColor = UIColor.lightGray
        label.decideTextAlignment()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(userBackgroundImageView)
        self.contentView.addSubview(userProfileImageView)
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(userHandleLabel)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            userBackgroundImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            userBackgroundImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            userBackgroundImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            userBackgroundImageView.bottomAnchor.constraint(equalTo: userProfileImageView.centerYAnchor),
            
            userProfileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            userProfileImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 100),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 8),
            userNameLabel.topAnchor.constraint(equalTo: userBackgroundImageView.bottomAnchor, constant: 4),
            
            userHandleLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
            userHandleLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 8)
            ])
    }
}
