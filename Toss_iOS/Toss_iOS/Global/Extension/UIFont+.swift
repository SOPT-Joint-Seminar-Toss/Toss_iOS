//
//  UIFontExtension.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/14.
//

import UIKit

extension UIFont {
    
    class var tossHeader1: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 24)!
    }
    
    class var tossHeader2: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 22)!
    }
    
    class var tossTitle1: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 20)!
    }
    
    class var tossTitle2: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 18)!
    }
    
    class var tossSubTitle: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 16)!
    }
    
    class var tossBody1: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 16)!
    }
    
    class var tossBody2: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 14)!
    }
    
    class var tossBody3: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 12)!
    }
    
    class var tossButton: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 16)!
    }
    class var tossMedium: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 10)!
    }
    class var tossMedium18: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 18)!
    }
    
    public enum SpoqaHanSanNeoType: String {
        case bold = "Bold"
        case medium = "Medium"
        case light = "Light"
        case regular = "Regular"
        case thin = "Thin"
    }
    static func spoqaHanSanNeo(_ type: SpoqaHanSanNeoType, size: CGFloat) -> UIFont {
        return UIFont(name: "SpoqaHanSansNeo-\(type.rawValue)", size: size)!
    }
}
