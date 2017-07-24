//
//  StorageReference+Post.swift
//  InstaRemake
//
//  Created by Jeremy Kim on 7/14/17.
//  Copyright © 2017 Jeremy Kim. All rights reserved.
//

import Foundation
import FirebaseStorage

extension StorageReference {
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = User.current.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
}
