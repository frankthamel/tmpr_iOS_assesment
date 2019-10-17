//
//  HomeUITableViewController.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

class HomeUITableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSet : [String]? = ["One", "Two", "Three", "Four" , "Five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        registerPullToRefreshControl()
    }
    
    func prepareView() {
        tableView.allowsSelection = false
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
    }
    
    func registerPullToRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = THEME_COLOR
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Fetching Data ...", attributes: .none)
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc private func refresh() {
        // Fetch Weather Data
        tableView.reloadData()
        
        // in the end call
        tableView.refreshControl?.endRefreshing()
    }
}

// MARK: - Table view data source
extension HomeUITableViewController : UITableViewDataSource {
    
       func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return dataSet == nil ? 0 : dataSet!.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath)

       
           return cell
       }
}
