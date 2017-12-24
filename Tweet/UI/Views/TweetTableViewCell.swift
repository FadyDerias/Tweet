//
//  TweetTableViewCell.swift
//  Tweet
//
//  Created by Fady on 12/22/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
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
    
    lazy var userTweetLabel: UILabel = {
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
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(userHandleLabel)
        self.contentView.addSubview(userTweetLabel)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            userNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            userHandleLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
            userHandleLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userHandleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            userTweetLabel.topAnchor.constraint(equalTo: userHandleLabel.bottomAnchor, constant: 8),
            userTweetLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            userTweetLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            userTweetLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
            ])
    }
    
}
