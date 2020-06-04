//
//  NewPostVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/24/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import Firebase

class NewPostVC: UIViewController {

    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var publishBtn: UIButton!
    @IBOutlet weak var postCaptionLabel: UITextView!
    
    var storage : StorageReference!
    var profilePath : StorageReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //postCaptionLabel.becomeFirstResponder()
        postCaptionLabel.delegate = self
        applyStyle()
        setReference()
        applyStyle()
        loadImagefromStorage()
    
    }
    
    func setReference() {
        storage = Storage.storage().reference(forURL: "gs://senlink-6d966.appspot.com")
        profilePath = storage.child("users_profile/\(Auth.auth().currentUser!.uid).png")
    }
    
    @IBAction func pubishClicked(_ sender: UIButton) {
        
        let post = Post(caption: "\(postCaptionLabel.text!)")
        post.save()
        print("succesffuly published.")
        self.dismiss(animated: true, completion: nil)
        
    }

}

//MARK: - delegate and styling

extension NewPostVC : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if postCaptionLabel.textColor == UIColor.lightGray {
            postCaptionLabel.text = nil
            postCaptionLabel.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if postCaptionLabel.text.isEmpty {
            postCaptionLabel.text = "What's happening ?"
            postCaptionLabel.textColor = UIColor.lightGray
        }
    }
    
    func setTextViewPlaceholder() {
        postCaptionLabel.text = "What's happening?"
        postCaptionLabel.textColor = UIColor.lightGray
    }
    
    //dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func applyStyle() {
        publishBtn.layer.cornerRadius = 25.0
        //
        userProfile.layer.cornerRadius = 30.0
        userProfile.layer.masksToBounds = true
        userProfile.layer.borderWidth = 1.0
        userProfile.layer.masksToBounds = true
        userProfile.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 1, alpha: 1)
        //
        postCaptionLabel.backgroundColor = .white
        postCaptionLabel.layer.cornerRadius = 10.0
        //
        setTextViewPlaceholder()
    }
    
}

//MARK: - profile image

extension NewPostVC {
    //apply style on the image
    func styleUserImage() {

    }
    
    //load the profile from storage
    func loadImagefromStorage() {
        profilePath?.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            DispatchQueue.main.async {
                self.userProfile.image = .none
            }
            print(error)
          } else {
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.userProfile.image = image
            }
          }
        }
    }
    
}
