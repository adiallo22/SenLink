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
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    var lCount : Int = 0
    var cCount : Int = 0
    var sCount : Int = 0
    
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
    
    @IBAction func likePressed(_ sender: UIButton) {
        lCount += 1
        print(lCount)
    }
    
    @IBAction func commmentPressed(_ sender: UIButton) {
        cCount += 1
        print(cCount)
    }
    
    @IBAction func sharePressed(_ sender: UIButton) {
        sCount += 1
        print(sCount)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setButton(button: likeButton, "like")
        setButton(button: commentButton, "comment")
        setButton(button: shareButton, "share")
    }
    
    func setButton(button: UIButton, _ name: String) {
        button.setImage(UIImage(named: "\(name)"), for: .normal)
        button.setTitle("", for: .normal)
    }

}
