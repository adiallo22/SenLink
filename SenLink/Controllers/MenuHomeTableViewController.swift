//
//  MenuHomeTableViewController.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/22/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class MenuHomeTableViewController: UITableViewController {
    
    enum MenuItem : Int {
        case profile
        case groups
        case setting
        case logout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 4
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menItem = MenuItem(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("dissmissed \(menItem)")
        }
    }

}
