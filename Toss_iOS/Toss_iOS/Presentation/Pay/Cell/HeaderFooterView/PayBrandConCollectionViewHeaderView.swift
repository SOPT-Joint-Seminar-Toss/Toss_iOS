//
//  PayBrancConCollectionViewHeaderView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class PayBrandConCollectionViewHeaderView: UICollectionReusableView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let titleLabel = UILabel()
    private lazy var subTitleLabel = UILabel()
    
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
        titleLabel.do {
            $0.text = "브랜드콘"
            $0.textColor = .tossGrey600
            $0.textAlignment = .left
            $0.font = .tossTitle1
        }
        
        subTitleLabel.do {
            $0.text = "살 때마다 토스포인트 3% 적립"
            $0.textColor = .tossBlue
            $0.font = .tossBody1
            $0.textAlignment = .left
        }
    }
    
    private func hierarchy() {
        self.addSubviews(titleLabel, subTitleLabel)
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(27)
            $0.leading.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
        }
    }
}



