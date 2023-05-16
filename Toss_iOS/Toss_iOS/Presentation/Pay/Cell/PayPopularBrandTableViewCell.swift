//
//  PayPopularBrandTableViewCell.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

import SnapKit
import Then

final class PayPopularBrandTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    
    private let brandRanking = UILabel()
    private let brandImage = UIImageView()
    private let brandName = UILabel()
    
    //MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellStyle()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func cellStyle() {
        brandRanking.do {
            $0.font = .tossBody1
            $0.textColor = .tossDarkblue
            $0.textAlignment = .left
        }
        
        brandImage.do {
            $0.makeCornerRound(radius: 19)
        }
        
        brandName.do {
            $0.font = .tossBody1
            $0.textColor = .tossGrey400
            $0.textAlignment = .left
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(
            brandRanking,
            brandImage,
            brandName
        )
    }
    
    private func layout() {
        brandRanking.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(31)
        }
        
        brandImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.brandRanking.snp.trailing).offset(21)
            $0.size.equalTo(38)
        }
        
        brandName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.brandImage.snp.trailing).offset(16)
        }
    }
    
    public func dataBind(_ brand: Brand) {
        brandRanking.text = brand.rank
        brandImage.image = brand.image
        brandName.text = brand.name
    }
}




