//
//  SignupVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/21/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignupVC: UIViewController {

    @IBOutlet weak var fnameLabel: UITextField!
    @IBOutlet weak var lnameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var pwdLabel: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    let auth = Auth.auth()
    var db : Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.SignUP
        db = Firestore.firestore()
        errorLabel.alpha = 0
        applyStyle()
        
    }
        
    @IBAction func signupPressed(_ sender: UIButton) {
        let error = checkError()
        if error != nil {
            setError(error!)
        } else {
            let email = emailLabel.text!
            let pwd = pwdLabel.text!
            let fname = fnameLabel.text!
            let lname = lnameLabel.text!
            auth.createUser(withEmail: email, password: pwd) { (result, err) in
                if err != nil {
                    self.setError("Error creating new user")
                } else {
                    self.db?.collection("users").document("\(self.auth.currentUser!.uid)").setData(["First name":"\(fname)", "Last name": "\(lname)", "Email":"\(email)"])
                    self.connectUser()
                }
            }
        }
    }
    

}

extension SignupVC {
    
    //return error if atleast one textfield is empty
    func checkError() -> String? {
        if fnameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lnameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || pwdLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill in all the textfield"
        }
        return nil
    }
    
    //make the error label visible and set the text
    func setError(_ err : String) {
        errorLabel.text = err
        errorLabel.alpha = 1
    }
    
    //perform segue to the tab controller
    func connectUser() {
        let main : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = main.instantiateViewController(withIdentifier: "Connected") as! mainVC
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    //dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //apply style to buttons and textfield
    func applyStyle() {
        Style.styleTextField(emailLabel)
        Style.styleTextField(pwdLabel)
        Style.styleTextField(fnameLabel)
        Style.styleTextField(lnameLabel)
        Style.styleFilledButton(signupBtn)
    }
    
}
