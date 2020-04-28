//
//  DirectMessageCell.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/28/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class DirectMessageCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dmContent: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
