//
//  BodyPostTableViewCell.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/24/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class BodyPostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var numberOfLikes: UIButton!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
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
        post.caption = commentsLabel.text
        post.time = Int(timeLabel.text!)
        post.postImg = postImage.image
        post.like = Int(numberOfLikes.currentTitle!)
    }

}
