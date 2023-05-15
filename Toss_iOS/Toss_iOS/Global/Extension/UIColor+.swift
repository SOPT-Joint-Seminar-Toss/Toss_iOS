//
//  UIColorExtension.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/14.
//

import UIKit

extension UIColor {
    static let tossGrey600 = UIColor(hex: 0x191E28)
    static let tossGrey500 = UIColor(hex: 0x333D4B)
    static let tossGrey400 = UIColor(hex: 0x4E5A67)
    static let tossGrey300 = UIColor(hex: 0x8D94A0)
    static let tossGrey200 = UIColor(hex: 0xE4E9EC)
    static let tossGrey100 = UIColor(hex: 0xF2F3F5)
    static let tossWhite = UIColor(hex: 0xFFFFFF)
    static let tossDarkblue = UIColor(hex: 0x204FF5)
    static let tossBlue = UIColor(hex: 0x4880EE)
    static let tossLightblue = UIColor(hex: 0xDAEBFF)
    static let tossWarning = UIColor(hex: 0xEF4452)
}

extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
