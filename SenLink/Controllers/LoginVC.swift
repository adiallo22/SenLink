//
//  LoginVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var pwdLabel: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.signIn
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
    }
    

}
