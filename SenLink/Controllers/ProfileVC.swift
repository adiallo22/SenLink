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
    
    var storage : StorageReference!
    var profilePath : StorageReference?
    var firestoreDB : Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setReference()
        applyStyleOnProfileImage()
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
    
}


//MARK: - download data from firebase

extension ProfileVC {
    
    func downloadProfileImage() {
        profilePath?.downloadURL(completion: { (url, error) in
            if error != nil {
                print("\(error!)")
            } else {
                if let url = url {
                    DispatchQueue.main.async {
                        let data = UIImage(data: url.absoluteURL.dataRepresentation)
                        self.profileImg.image = data
                    }
                }
            }
        })
    }
    
    func downloadUserData() {
        firestoreDB.document("users/\(Auth.auth().currentUser!.uid)").getDocument { (doc, error) in
            if error != nil {
                print("error downloading user name and location")
            } else {
                print(doc?.data()) 
            }
        }
    }
    
    func setReference() {
        storage = Storage.storage().reference(forURL: "gs://senlink-6d966.appspot.com")
        profilePath = storage.child("users_profile/\(Auth.auth().currentUser!.uid).png")
        firestoreDB = Firestore.firestore()
    }
    
}
