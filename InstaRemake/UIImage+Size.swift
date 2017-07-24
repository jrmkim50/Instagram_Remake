//
//  UIImage+Size.swift
//  InstaRemake
//
//  Created by Jeremy Kim on 7/14/17.
//  Copyright © 2017 Jeremy Kim. All rights reserved.
//

import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
