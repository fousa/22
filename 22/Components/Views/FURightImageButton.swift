//
//  FURightImageButton.swift
//  22
//
//  Created by Jelle Vandebeeck on 18/11/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

@IBDesignable class FURightImageButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let titleSize = (titleLabel!.text! as NSString).sizeWithAttributes([ NSFontAttributeName : titleLabel!.font ])
        let imageSize = imageView!.image!.size

        imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + 30, 0, 0)
        titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, imageSize.width)
    }
    
    override func intrinsicContentSize() -> CGSize {
        let titleSize = (titleLabel!.text! as NSString).sizeWithAttributes([ NSFontAttributeName : titleLabel!.font ])
        let imageSize = imageView!.image!.size
        
        return CGSizeMake(titleSize.width + imageSize.width + 30, super.intrinsicContentSize().height)
    }
    
}