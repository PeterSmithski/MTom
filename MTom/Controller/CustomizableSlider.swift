//
//  CustomizableSlider.swift
//  MTom
//
//  Created by Peter Kowalski on 11/03/2019.
//  Copyright © 2019 Peter Kowalski. All rights reserved.
//

import UIKit

@IBDesignable
class CustomizableSlider: UISlider {

    @IBInspectable var thumbImage: UIImage?{
        didSet {
            setThumbImage(thumbImage, for: .normal)
            setThumbImage(thumbImage, for: .highlighted)
        }
    }

    
}
