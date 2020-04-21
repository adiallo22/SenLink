//
//  LoginVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var pwdLabel: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    let auth = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.signIn
        errorLabel.alpha = 0
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let error = checkError()
        if error != nil {
            setError(err: error!)
        } else {
            auth.signIn(withEmail: emailLabel.text!, password: pwdLabel.text!) { (result, error) in
                if error != nil {
                    self.setError(err: "Wrong user or password")
                } else {
                    self.transitionTo(here: "")
                }
            }
        }
        
    }
    
    
    @IBAction func signupPressed(_ sender: UIButton) {
        transitionTo(here: Constants.linkToSignup)
    }
    

}

//MARK: - section heading

extension LoginVC {
    
    func checkError() -> String? {
        if emailLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || pwdLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill in all the textfield"
        }
        return nil
    }
    
    func setError(err: String) {
        errorLabel.text = checkError()
        errorLabel.alpha = 1
    }
    
    func transitionTo(here : String?) {
        if here != "" {
            performSegue(withIdentifier: here!, sender: self)
        } else {
            let main : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = main.instantiateViewController(withIdentifier: "Connected") as! mainVC
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
    
}
