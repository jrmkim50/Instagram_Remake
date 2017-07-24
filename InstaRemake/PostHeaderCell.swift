//
//  PostHeaderCell.swift
//  InstaRemake
//
//  Created by Jeremy Kim on 7/14/17.
//  Copyright © 2017 Jeremy Kim. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    static let height: CGFloat = 54

    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
