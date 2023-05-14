//
//  UIFontExtension.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/14.
//

import UIKit

extension UIFont {
    
    enum Family: String {
        case Bold, Light, Medium, Regular, Thin
    }
    
    static func font(family: Family, size: CGFloat) -> UIFont! {
        return UIFont(name: "SpoqaHanSansNeo-\(family)", size: size)
    }
    
}
