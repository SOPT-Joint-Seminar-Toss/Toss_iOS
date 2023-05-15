//
//  UIImageView+.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit
import Kingfisher

extension UIImageView{
    func kfSetImage(url : String?){
        
        guard let url = url else {
            self.image = Image.toss
            return }
        
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}

