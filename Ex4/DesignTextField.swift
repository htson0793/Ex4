//
//  DesignTextField.swift
//  Ex4
//
//  Created by Hoang Son on 10/9/18.
//  Copyright © 2018 Hoang Son. All rights reserved.
//

import UIKit
@IBDesignable
class DesignTextField: UITextField {
    @IBInspectable var leftImage : UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var leftPadding : CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 18))
            imageView.image = image
            
            var  width = leftPadding + 20
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + 20
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            leftView = view
        } else {
            leftViewMode = .never
        }
        
    }
   

}
