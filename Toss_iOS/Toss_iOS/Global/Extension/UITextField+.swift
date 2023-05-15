//
//  UITextField.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

extension UITextField {
    
    func addLeftPadding(inset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(inset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
    
    func addLeftImage(image: UIImage) {
        let leftImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        leftImage.image = image
        self.leftView = leftImage
        self.leftViewMode = ViewMode.always
    }
}
