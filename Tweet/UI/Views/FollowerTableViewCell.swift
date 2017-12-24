//
//  FollowerTableViewCell.swift
//  Tweet
//
//  Created by Fady on 12/21/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {
    
    lazy var userAvatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.brown
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
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
    
    lazy var userBioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(15)
        label.decideTextAlignment()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Basic initialization
        self.backgroundColor = .clear
        self.selectionStyle = .none
        //Allowing table view separator line extend to the end of the cell.
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        //Adding Subviews
        self.contentView.addSubview(userAvatarImageView)
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(userHandleLabel)
        self.contentView.addSubview(userBioLabel)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            userAvatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            userAvatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 50),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 50),
            
            userNameLabel.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor, constant: -8),
            userNameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            userHandleLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
            userHandleLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userHandleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            userBioLabel.topAnchor.constraint(equalTo: userAvatarImageView.bottomAnchor, constant: 8),
            userBioLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            userBioLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            userBioLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
            ])
    }
}
