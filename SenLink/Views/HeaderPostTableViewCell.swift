//
//  HeaderPostTableViewCell.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/24/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class HeaderPostTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var followButton: UIButton!
    
    var post : Post! {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI() {
        userImage.layer.cornerRadius = userImage.bounds.width / 2.0
        userImage.layer.masksToBounds = true
        post.profileImg = userImage.image
        post.username = usernameLabel.text
        post.followBtn = followButton
    }

}
