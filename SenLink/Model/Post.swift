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
    var time : Int?
    
    var db : Firestore!
    
    init(caption : String) {
        db = Firestore.firestore()
        self.caption = caption
        self.likes = 0
        self.comments = 0
        self.shares = 0
    }
    
    func save() {
        db.collection("posts").addDocument(data: dictionnary())
    }
    
    func dictionnary() -> [String:Any] {
        return [
            "caption":"\(caption!)",
            "likes":"\(likes!)",
            "comments":"\(comments!)",
            "shares":"\(shares!)"
        ]
    }
    
}
