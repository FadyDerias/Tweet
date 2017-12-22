//
//  TweetsTableViewController.swift
//  Tweet
//
//  Created by Fady on 12/21/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

let followerInformationTableHeaderViewIdentifier = "followerInformationTableHeaderViewIdentifier"
let tweetTableViewCellIdentifier = "tweetTableViewCellIdentifier"

class FollowerInformationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellsForTableView()
        registerHeadersForTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: followerInformationTableHeaderViewIdentifier) as! FollowerInformationTableViewHeader
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tweetTableViewCellIdentifier, for: indexPath) as! TweetTableViewCell
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
}
