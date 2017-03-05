//
//  PostcellTableViewCell.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/4/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import UIKit

class PostcellTableViewCell: UITableViewCell {

    @IBOutlet weak var firimage: UIImageView!
    
    @IBOutlet weak var firlike: UIButton!
    
    @IBOutlet weak var firlikenumber: UILabel!
    @IBOutlet weak var firimagecaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
