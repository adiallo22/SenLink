//
//  MenuHomeTableViewController.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/22/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import Firebase

class MenuHomeTableViewController: UITableViewController {
    
    enum MenuItem : Int {
        case Profile
        case Groups
        case Setting
        case Logout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menItem = MenuItem(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("\(menItem) dismissed")
        }
        self.transitionTo(here: "to\(menItem)")
    }
    
    //MARK: - segue
    
    func transitionTo(here : String) {
        if here == "toLogout" {
            if Auth.auth().currentUser != nil {
                do {
                  try Auth.auth().signOut()
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
                }
            }
            logOutUser()
        } else {
            performSegue(withIdentifier: here, sender: self)
        }
    }
    
    func logOutUser() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.Segues.firstScreen) as! LoginVC
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }

}
