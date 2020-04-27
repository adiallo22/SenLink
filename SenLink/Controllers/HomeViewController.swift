//
//  HomeViewController.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//



//have to dismiss the menu bar when user tap outside og menu bar

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var postss = ["1", "2", "3"]
    var posts = [Post]()
    
    let transtion = MenuTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.Titles.Home
        table.rowHeight = 164.0
        table.delegate = self
        table.dataSource = self
//        Database.database().reference().child("posts").observe(.value) { (snapshot) in
//            print(snapshot)
//        }
    }

    @IBAction func menuBtnPressed(_ sender: UIBarButtonItem) {
        //performSegue(withIdentifier: Constants.openMenu, sender: self)
        let menuHomeVC = storyboard?.instantiateViewController(identifier: "menuHomeVC")
        menuHomeVC?.modalPresentationStyle = .overCurrentContext
        menuHomeVC?.transitioningDelegate = self
        present(menuHomeVC!, animated: true)
    }
}

//MARK: - menu presentation delegate

extension HomeViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transtion.isPresenting = true
        return transtion
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transtion.isPresenting = false
        return transtion
    }
}


//MARK: - data source and delegate

extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! HomePostCellsTableViewCell
//        cell?.textLabel?.text = postss[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(".")
    }
    
}
