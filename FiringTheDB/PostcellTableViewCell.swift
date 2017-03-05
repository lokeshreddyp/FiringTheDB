//
//  PostcellTableViewCell.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/4/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import UIKit

class PostcellTableViewCell: UITableViewCell {
    var post:Post!
    @IBOutlet weak var firimage: UIImageView!
    
    @IBOutlet weak var firlike: UIButton!
    
    @IBOutlet weak var firlikenumber: UILabel!
    @IBOutlet weak var firimagecaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurecell(post:Post) {
        self.post = post
        self.firimagecaption.text = post.imagecap
        self.firlikenumber.text = "\(post.likes)"
        
        
    }

}
