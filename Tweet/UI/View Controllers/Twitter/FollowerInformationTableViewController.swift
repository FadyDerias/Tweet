//
//  TweetsTableViewController.swift
//  Tweet
//
//  Created by Fady on 12/21/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

let followerInformationTableHeaderViewIdentifier = "followerInformationTableHeaderViewIdentifier"
let tweetTableViewCellIdentifier = "tweetTableViewCellIdentifier"

class FollowerInformationTableViewController: UITableViewController {
    
    var tweets = [Tweet]()
    var follower: TWFollower!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleForViewControllerMediumFont(title: "Information".localized)
        registerCellsForTableView()
        registerHeadersForTableView()
        getUserTweets()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: followerInformationTableHeaderViewIdentifier) as! FollowerInformationTableViewHeader
        headerView.configureForFollower(follower: self.follower)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tweetTableViewCellIdentifier, for: indexPath) as! TweetTableViewCell
        let tweet = tweets[indexPath.row]
        cell.configureTweetForUser(tweet: tweet, follower: self.follower)
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    // MARK: - Support
    
    func registerHeadersForTableView() {
        self.tableView.register(FollowerInformationTableViewHeader.self, forHeaderFooterViewReuseIdentifier: followerInformationTableHeaderViewIdentifier)
    }
    
    func registerCellsForTableView() {
        self.tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: tweetTableViewCellIdentifier)
    }
    
    // MARK: - Networking
    
    func getUserTweets() {
        SVProgressHUD.show()
        
        TWTwitterManager.sharedInstance.getTweetsForUser(userId: follower.id, { (tweets) in
            SVProgressHUD.dismiss()
            self.tweets = tweets
            self.tableView.reloadData()
        }) { (error) in
            SVProgressHUD.dismiss()
            let defaultNetworkingController = UIAlertController.defaultNetworkingErrorAlertController({
                self.getUserTweets()
            })
            
            self.present(defaultNetworkingController, animated: true, completion: nil)
        }
    }
}
