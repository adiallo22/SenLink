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
import FirebaseStorage

class SignupVC: UIViewController {

    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var fnameLabel: UITextField!
    @IBOutlet weak var lnameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var pwdLabel: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var locationField: UITextField!
    
    let auth = Auth.auth()
    var db : Firestore?
    var storage : StorageReference?
    var imgPicker : UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.Titles.SignUP
        db = Firestore.firestore()
        storage = Storage.storage(url: Constants.firestoreReference).reference().child("users_profile")
        imgPicker = UIImagePickerController()
        imgPicker?.delegate = self
        errorLabel.alpha = 0
        applyStyle()
        
    }
    
    
    @IBAction func uploadBtnPressed(_ sender: Any) {
        pickImage()
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
            let location = locationField.text!
            auth.createUser(withEmail: email, password: pwd) { (result, err) in
                if err != nil {
                    self.setError("Error creating new user")
                } else {
                    self.uploadDataToFirestore(fname: fname, lname: lname, email: email, location: location)
                    self.uploadProfileImageToStorage()
                    self.connectUser()
                }
            }
        }
    }

}
//MARK: - error handling and connexion

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
    
    
//MARK: - Styling
    
    
    //apply style to buttons and textfield
    func applyStyle() {
        Style.styleTextField(emailLabel)
        Style.styleTextField(pwdLabel)
        Style.styleTextField(fnameLabel)
        Style.styleTextField(lnameLabel)
        Style.styleTextField(locationField)
        Style.styleFilledButton(signupBtn)
        Style.styleHollowButton(btnUpload)
        btnUpload.layer.cornerRadius = 15
        profileImgCircle()
    }
    
    //style the profile image
    func profileImgCircle() {
        //round the borders
        self.userImg.layer.cornerRadius = 35
        self.userImg.layer.masksToBounds = true
        //set border width and color
        self.userImg.layer.borderWidth = 2
        self.userImg.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
//MARK: - Store Data
    
    
extension SignupVC {
        
    //save image to storage
    func uploadProfileImageToStorage() {
        if let imageData = userImg.image!.pngData() {
            storage?.child("\(String(describing: auth.currentUser!.uid)).png").putData(imageData, metadata: nil, completion: { (data, error) in
                if error != nil {
                    print("error saving profile image")
                    self.setError("Error uploading image")
                } else {
                    print("successfully uploaded profile image")
                }
            })
        }
    }
    
    //save data to firestore
    func uploadDataToFirestore(fname: String, lname: String, email: String, location: String) {
        db?.collection("users").document("\(self.auth.currentUser!.uid)").setData(["First name":"\(fname)", "Last name": "\(lname)", "Email":"\(email)", "Location":"\(location)"])
    }
    
}
    


//MARK: - image picker handling

extension SignupVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.editedImage] as? UIImage {
            userImg.image = img
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func pickImage() {
        imgPicker?.allowsEditing = true
        imgPicker?.sourceType = .photoLibrary
        present(imgPicker!, animated: true, completion: nil)
    }
    
}
