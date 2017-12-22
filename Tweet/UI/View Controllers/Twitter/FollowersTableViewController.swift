//
//  FollowersTableViewController.swift
//  Tweet
//
//  Created by Fady on 12/21/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

let followerTableViewCellIdentifier = "followerTableViewCellIdentifier"

class FollowersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellsForTableView()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: followerTableViewCellIdentifier, for: indexPath) as! FollowerTableViewCell
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
        self.navigationController?.pushViewController(followerInformationViewController, animated: true)
    }
    
    // MARK: - Support
    
    func registerCellsForTableView() {
        self.tableView.register(FollowerTableViewCell.self, forCellReuseIdentifier: followerTableViewCellIdentifier)
    }
}
