//
//  Post.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/24/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Post {
    
    var username : String?
    var profileImg : UIImage?
    var likes : Int?
    var comments : Int?
    var shares : Int?
    var caption : String?
    var postImg : UIImage?
    var followBtn : UIButton?
    var time : String?
    
    var db : DatabaseReference!
    
    init(caption : String) {
        db = Database.database().reference()
        self.caption = caption
        self.likes = 0
        self.comments = 0
        self.shares = 0
    }
    
    init(snapshot : DataSnapshot) {
        db = snapshot.ref
        if let value = snapshot.value as? [String : Any] {
            caption = value["caption"] as? String
            username = value["username"] as? String
            comments = value["comments"] as? Int
            likes = value["likes"] as? Int
            shares = value["shares"] as? Int
            time = value["time"] as? String
        }
    }
    
    func save() {
        db.child("posts").childByAutoId().setValue(dictionnary())
        //db.collection("posts").addDocument(data: dictionnary())
    }
    
    func dictionnary() -> [String:Any] {
        return [
            "caption":"\(String(describing: caption!))",
            "likes" : likes!,
            "comments" :comments!,
            "shares" : shares!,
            "username" : "\(String(describing: Auth.auth().currentUser!.email!))",
            "time" : "\(String(describing: Date()))"
        ]
    }
    
}
