//
//  PayProductCollectionHeaderView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayProductCollectionHeaderView: UICollectionReusableView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let productTitleLabel = UILabel()
    private lazy var countLabel = UILabel()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func style() {
        productTitleLabel.do {
            $0.text = "최저가 공동구매"
            $0.textColor = .tossGrey500
            $0.textAlignment = .left
            $0.font = .tossTitle2
        }
        
        countLabel.do {
            $0.text = "02:16:27 남음"
            $0.textColor = .tossWarning
            $0.font = .tossBody2
            $0.textAlignment = .left
        }
    }
    
    private func hierarchy() {
        self.addSubviews(productTitleLabel, countLabel)
    }
    
    private func layout() {
        productTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(22)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.productTitleLabel.snp.trailing).offset(14)
        }
    }
}


