//
//  PayBrandConCollectionViewCell.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class PayBrandConCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Components
    
    private let brandConImage = UIImageView()
    private let brandConName = UILabel()
    
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
        brandConImage.do {
            $0.makeCornerRound(radius: 15)
            $0.clipsToBounds = true
        }
        
        brandConName.do {
            $0.font = .tossBody2
            $0.textColor = .tossGrey500
            $0.textAlignment = .center
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(
            brandConImage,
            brandConName
        )
    }
    private func layout() {
        brandConImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(28)
        }
        
        brandConName.snp.makeConstraints {
            $0.top.equalTo(self.brandConImage.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func dataBind(_ brandCon: BrandCon) {
        brandConImage.image = brandCon.image
        brandConName.text = brandCon.name
    }
}

