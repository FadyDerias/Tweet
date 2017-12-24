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
    var cursor: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleForViewControllerMediumFont(title: "Followers".localized)
        setupNavigationBarButtons()
        registerCellsForTableView()
        retrieveFollowersFromCacheDirectory()
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
        cell.configureForFollower(follower: follower)
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let followerInformationViewController = FollowerInformationTableViewController()
        let follower = self.followers[indexPath.row]
        followerInformationViewController.follower = follower
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
    
    func setupNavigationBarButtons () {
        let logoutImage = UIImage(named: "logout")
        let logoutRightBarButtonItem = UIBarButtonItem(image: logoutImage, style: .plain, target: self, action: #selector(logoutButtonTapped))
        self.navigationItem.rightBarButtonItems = [logoutRightBarButtonItem]
    }
    
    @objc func logoutButtonTapped() {
        let logoutAlertController = UIAlertController.confirmLogoutAlertController {
            TWAuthenticationManager.sharedInstance.logoutUser()
            TWNavigationHelper.sharedInstance.setRootViewControllerForUserAuthentication()
        }
        
        self.present(logoutAlertController, animated: true, completion: nil)
    }
    
    func retrieveFollowersFromCacheDirectory() {
        let cachedFollowers = TWFollowersHelper.sharedInstance.retrieveUserFollowersFromDocumentsDirectory()
        self.followers = cachedFollowers
        self.tableView.reloadData()
        
        if (cachedFollowers.isEmpty) {
            self.cursor = "-1"
        } else {
            retrieveCachedCursor()
        }
    }
    
    func retrieveCachedCursor() {
        if let cursor = TWFollowersHelper.sharedInstance.retrieveLastFollowersCursorFromUserDefaults() {
            self.cursor = cursor
        } else {
            self.cursor = "-1"
        }
    }
    
    //MARK: - Networking
    
    func getUserFollowers() {
        SVProgressHUD.show()
        
        TWTwitterManager.sharedInstance.getUserFollowers(cursor: cursor, { (followers, nextCursor) in
            SVProgressHUD.dismiss()
            self.followers.append(contentsOf: followers)
            self.cursor = nextCursor
            TWFollowersHelper.sharedInstance.saveUserFollowersToDocumentsDirectory(followers: self.followers)
            TWFollowersHelper.sharedInstance.saveLastFollowersCursorToUserDefaults(cursor: self.cursor)
            self.tableView.reloadData()
        }) { (error) in
            SVProgressHUD.dismiss()
            
            let defaultNetworkingController = UIAlertController.defaultNetworkingErrorAlertController({
                self.getUserFollowers()
            })
            
            self.present(defaultNetworkingController, animated: true, completion: nil)
        }
    }
}
