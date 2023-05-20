//
//  SubSectionButton.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/18.
//

import UIKit
import SnapKit
import Then

class SubSectionButton: UIButton {
    //MARK: - Properties
    var image : UIImage
    var title : String
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
        
        super.init(frame: .zero)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    private func setUI() {
        setTitle(title, for: .normal)
        setTitleColor(.tossGrey400, for: .normal)
        let resizedImage = resizeImage(image: image, newSize: CGSize(width: 24, height: 24))
        setImage(resizedImage, for: .normal)
        titleLabel?.font = .spoqaHanSanNeo(.medium, size: 16)
        backgroundColor = .tossGrey200
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -5)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    }
    func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

