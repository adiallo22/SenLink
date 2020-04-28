//
//  HomePostCellsTableViewCell.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class HomePostCellsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var sharesCount: UILabel!
    
    var post : Post! {
        didSet {
            username.text = post.username
            caption.text = post.caption
            likesCount.text = "\(String(describing: post.likes!))"
            commentsCount.text = "\(String(describing: post.comments!))"
            sharesCount.text = "\(String(describing: post.shares!))"
            //time.text = "\(post.time)"
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

}
