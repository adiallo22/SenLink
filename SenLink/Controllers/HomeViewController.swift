//
//  HomeViewController.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var posts = [Post]()
    
    let transtion = MenuTransition()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.Titles.Home
        table.rowHeight = 164.0
        table.delegate = self
        table.dataSource = self
        fetchPosts(from: Database.database().reference().child("posts"))

    }

    @IBAction func menuBtnPressed(_ sender: UIBarButtonItem) {
        //performSegue(withIdentifier: Constants.openMenu, sender: self)
        let menuHomeVC = storyboard?.instantiateViewController(identifier: Constants.Segues.menuHomeVC)
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
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! HomePostCellsTableViewCell
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(posts[indexPath.row].caption!)
    }
    
}

//MARK: - fetch posts

extension HomeViewController {
    
    func fetchPosts(from db: DatabaseReference) {
        
        db.observe(.value) { (snapshot) in
            for child in snapshot.children {
                let childSnapPost = child as! DataSnapshot
                let post = Post(snapshot: childSnapPost)
                self.posts.insert(post, at: 0)
            }
            self.table.reloadData()
        }
        
    }
    
}
