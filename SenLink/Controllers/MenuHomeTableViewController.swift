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

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menItem = MenuItem(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("dissmissed \(menItem)")
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }

}
