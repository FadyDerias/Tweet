//
//  FollowersTableViewController.swift
//  Tweet
//
//  Created by Fady on 12/21/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

let followerTableViewCellIdentifier = "followerTableViewCellIdentifier"

class FollowersTableViewController: UITableViewController {
    
    var followers = [TWFollower]()
    var cursor = "-1"

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellsForTableView()
        getUserFollowers()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followers.count
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: followerTableViewCellIdentifier, for: indexPath) as! FollowerTableViewCell
        let follower = followers[indexPath.row]
        cell.userNameLabel.text = follower.name
        cell.userHandleLabel.text = follower.handle
        cell.userBioLabel.text = follower.bio
        let url = URL(string: follower.profileImageUrl)
        let placeHolderImage = UIImage(named: "userPlaceHolder")
        cell.userAvatarImageView.sd_setImage(with: url!, placeholderImage: placeHolderImage, options: .highPriority , progress: nil, completed: nil)
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let followerInformationViewController = FollowerInformationTableViewController()
        self.navigationController?.pushViewController(followerInformationViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if ((indexPath as NSIndexPath).row == self.followers.count - 1 && cursor != "0") {
            self.getUserFollowers()
        }
    }
    
    // MARK: - Support
    
    func registerCellsForTableView() {
        self.tableView.register(FollowerTableViewCell.self, forCellReuseIdentifier: followerTableViewCellIdentifier)
    }
    
    //MARK: - Networking
    
    func getUserFollowers() {
        SVProgressHUD.show()
        
        TWTwitterManager.sharedInstance.getUserFollowers(cursor: cursor, { (followers, nextCursor) in
            SVProgressHUD.dismiss()
            self.followers.append(contentsOf: followers)
            self.cursor = nextCursor
            self.tableView.reloadData()
        }) { (error) in
            SVProgressHUD.dismiss()
            //Present Default Networking Alert Controller
        }
    }
}
