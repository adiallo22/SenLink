//
//  ProfileVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/23/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var seperatorLine: UIView!
    
    var storage : StorageReference!
    var profilePath : StorageReference?
    var firestoreDB : Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setReference()
        applyStyleOnProfileImage()
        drawTheSeparatorLine()
        downloadProfileImage()
        downloadUserData()
        
    }

}


//MARK: - styling

extension ProfileVC {
    
    func applyStyleOnProfileImage() {
        profileImg.layer.borderWidth = 1.0
        profileImg.layer.borderColor = .init(srgbRed: 1, green: 0, blue: 1, alpha: 1)
        profileImg.layer.cornerRadius = 45.0
        profileImg.layer.masksToBounds = true
    }
    
    func drawTheSeparatorLine() {
        seperatorLine.backgroundColor = UIColor(displayP3Red: 1, green: 0, blue: 1, alpha: 1)
    }
    
}


//MARK: - download data from firebase

extension ProfileVC {
    
    func downloadProfileImage() {
        profilePath?.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            DispatchQueue.main.async {
                self.profileImg.image = .none
            }
            print(error)
          } else {
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.profileImg.image = image
            }
          }
        }
    }
    
    func downloadUserData() {
        firestoreDB.document("users/\(Auth.auth().currentUser!.uid)").getDocument { (doc, error) in
            if error != nil {
                print("error downloading user name and location")
            } else {
                if let doc = doc {
                    DispatchQueue.main.async {
                        self.usernameLabel.text = "\(doc.get("First name")!) \(doc.get("Last name")!)"
                        self.locationLabel.text = "📍 \(doc.get("Location")!)"
                    }
                }
            }
        }
    }
    
    func setReference() {
        storage = Storage.storage().reference(forURL: "gs://senlink-6d966.appspot.com")
        profilePath = storage.child("users_profile/\(Auth.auth().currentUser!.uid).png")
        firestoreDB = Firestore.firestore()
    }
    
}
