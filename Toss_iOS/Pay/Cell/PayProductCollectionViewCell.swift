//
//  PayProductCollectionViewCell.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private var productId: Int?
    private var productEndData: String?
    
    //MARK: - UI Components
    
    private let productImage = UIImageView()
    private let productLabel = UILabel()
    private let productDiscount = UILabel()
    private let productPrice = UILabel()
    private let purchaserProfile = UIImageView()
    private let purchaserCountLabel = UILabel()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellStyle()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func cellStyle() {
        productImage.do {
            $0.makeCornerRound(radius: 15)
            $0.clipsToBounds = true
        }
        
        productLabel.do {
            $0.font = .tossBody3
            $0.textColor = .tossGrey400
            $0.textAlignment = .left
        }
        
        productDiscount.do {
            $0.font = .tossTitle2
            $0.textColor = .tossBlue
            $0.textAlignment = .left
        }
        
        productPrice.do {
            $0.font = .tossTitle2
            $0.textColor = .tossGrey400
            $0.textAlignment = .left
        }
        
        purchaserProfile.do {
            $0.image = Image.profile
        }
        
        purchaserCountLabel.do {
            $0.font = .tossBody3
            $0.textColor = .tossGrey300
            $0.textAlignment = .left
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(
            productImage,
            productLabel,
            productPrice,
            productDiscount,
            purchaserProfile,
            purchaserCountLabel
        )
    }
    private func layout() {
        productImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(300)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(self.productImage.snp.bottom).offset(9)
            $0.leading.equalToSuperview()
        }
        
        productDiscount.snp.makeConstraints {
            $0.top.equalTo(self.productLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
        }
        
        productPrice.snp.makeConstraints {
            $0.top.equalTo(self.productDiscount)
            $0.leading.equalTo(self.productDiscount.snp.trailing).offset(5)
        }
        
        purchaserProfile.snp.makeConstraints {
            $0.top.equalTo(self.productDiscount.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
            $0.width.equalTo(37)
            $0.height.equalTo(15)
        }
        
        purchaserCountLabel.snp.makeConstraints {
            $0.top.equalTo(self.productPrice.snp.bottom).offset(6)
            $0.leading.equalTo(self.purchaserProfile.snp.trailing).offset(10)
        }
    }
    
    public func dataBind(_ product: ProductResponse, _ profileData: Product) {
        productImage.kfSetImage(url: product.imageURL)
        productLabel.text = product.title
        productDiscount.text = "\(String(product.discountRate))%"
        productPrice.text = "\(String(product.price))원"
        productEndData = product.endDate
        productId = product.id
        purchaserProfile.image = profileData.profileImage
        purchaserCountLabel.text = "\(profileData.count)명이 구매중"
    }
}
