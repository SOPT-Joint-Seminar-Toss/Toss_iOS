//
//  PayProductCollectionFooterView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayProductCollectionFooterView: UICollectionReusableView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let separator = UIView()
    private lazy var moreProductButton = UIButton()
    private let rightButton = UIImageView()
    
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
        separator.do {
            $0.backgroundColor = .tossGrey4
        }
        
        moreProductButton.do {
            $0.setTitle("최저가 공동구매 상품 더 보기", for: .normal)
            $0.setTitleColor(.tossGrey300, for: .normal)
            $0.titleLabel?.textAlignment = .center
            $0.titleLabel?.font = .tossBody2
        }
        
        rightButton.do {
            $0.image = Image.rightArrow
        }
    }
    
    private func hierarchy() {
        self.addSubviews(separator,moreProductButton, rightButton)
    }
    
    private func layout() {
        separator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        moreProductButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(25)
        }
    }
}


