//
//  NotificationVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.Titles.Notifications
        table.delegate = self
        table.dataSource = self
    }
    
}

//MARK: - data source and delegate

extension NotificationVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(".")
    }
    
}
