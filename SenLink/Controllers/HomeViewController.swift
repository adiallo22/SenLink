//
//  HomeViewController.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    let transtion = MenuTransition()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.Titles.Home
        table.delegate = self
        table.dataSource = self
        
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
