//
//  PayPopularConTableViewCell.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class PayPopularConTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    
    private let popularConImage = UIImageView()
    private let popularConName = UILabel()
    private let popularConPrice = UILabel()
    private let popularCashBack = UILabel()
    
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
        popularConImage.do {
            $0.makeCornerRound(radius: 10)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .tossGrey200)
        }
        
        popularConName.do {
            $0.font = .tossBody3
            $0.textColor = .tossGrey300
            $0.textAlignment = .left
        }
        
        popularConPrice.do {
            $0.font = .tossTitle2
            $0.textColor = .tossGrey500
            $0.textAlignment = .left
        }
        
        popularCashBack.do {
            $0.makeCornerRound(radius: 10)
            $0.backgroundColor = .tossLightblue
            $0.font = .tossBody3
            $0.textColor = .tossDarkblue
            $0.textAlignment = .center
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(
            popularConImage, popularConName, popularConPrice, popularCashBack
        )
    }
    
    private func layout() {
        popularConImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(22)
            $0.size.equalTo(52)
        }
        
        popularConName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalTo(self.popularConImage.snp.trailing).offset(16)
        }
        
        popularConPrice.snp.makeConstraints {
            $0.top.equalTo(self.popularConName.snp.bottom).offset(4)
            $0.leading.equalTo(self.popularConName)
        }
        
        popularCashBack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(23)
            $0.width.equalTo(63)
            $0.height.equalTo(32)
        }
    }
    
    public func dataBind(_ popularCon: PopularConResponse) {
        popularConImage.kfSetImage(url: popularCon.imageURL)
        popularConName.text = "\(popularCon.brandTitle) | \(popularCon.productTitle)"
        popularConPrice.text = "\(String(popularCon.price))원"
        popularCashBack.text = "\(String(popularCon.point)) 적립"
    }
}


