//
//  SignupVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var fnameLabel: UITextField!
    @IBOutlet weak var lnameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var pwdLabel: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.SignUP
        applyStyle()
        
    }
        
    @IBAction func signupPressed(_ sender: UIButton) {
    }
    

}

extension SignupVC {
    
    func applyStyle() {
        Style.styleTextField(emailLabel)
        Style.styleTextField(pwdLabel)
        Style.styleTextField(fnameLabel)
        Style.styleTextField(lnameLabel)
        Style.styleFilledButton(signupBtn)
    }
    
}
