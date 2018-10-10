//
//  designButton.swift
//  Ex4
//
//  Created by Hoang Son on 10/10/18.
//  Copyright © 2018 Hoang Son. All rights reserved.
//

import UIKit

class designButton: UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
