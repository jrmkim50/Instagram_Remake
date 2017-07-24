//
//  FindFriendsCell.swift
//  InstaRemake
//
//  Created by Jeremy Kim on 7/16/17.
//  Copyright © 2017 Jeremy Kim. All rights reserved.
//

import Foundation
import UIKit
protocol FindFriendsCellDelegate: class {
    func didTapFollowButton(_ followButton: UIButton, on cell: FindFriendsCell)
}
class FindFriendsCell: UITableViewCell {
    weak var delegate: FindFriendsCellDelegate?
    @IBOutlet weak var usernameLabel: UILabel! 
    
    @IBOutlet weak var followButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        followButton.layer.borderColor = UIColor.lightGray.cgColor
        followButton.layer.borderWidth = 1
        followButton.layer.cornerRadius = 6
        followButton.clipsToBounds = true
        
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitle("Following", for: .selected)

    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
        delegate?.didTapFollowButton(sender as! UIButton, on: self)
        print("Follow button tapped")
    }
    
    
}
