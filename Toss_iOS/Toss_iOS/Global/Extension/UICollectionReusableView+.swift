//
//  UICollectionReusableView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

extension UICollectionReusableView{
    static var reuseCellIdentifier  : String {
        return String(describing: self)
    }
}

