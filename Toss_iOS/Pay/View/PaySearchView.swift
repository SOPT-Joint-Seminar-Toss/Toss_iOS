//
//  PaySearchView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PaySearchView: UIView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let searchTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        titleLabel.do {
            $0.text = "토스페이"
            $0.font = .tossHeader1
            $0.textAlignment = .left
            $0.textColor = .tossGrey600
        }
        
        searchTextField.do {
            $0.addLeftImage(image: Image.search)
            $0.font = .tossBody1
            $0.placeholder = "상품을 검색해보세요"
            $0.attributedPlaceholder = NSAttributedString(string: "상품을 검색해보세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.tossGrey300])
            $0.backgroundColor = .tossGrey100
            $0.makeCornerRound(radius: 10)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            titleLabel,
            searchTextField
        )
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(22)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(42)
        }
    }
}

