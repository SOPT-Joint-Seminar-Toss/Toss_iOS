//
//  PayCashBackTableFooterView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

import SnapKit
import Then

final class PayCashBackTableFooterView: UITableViewHeaderFooterView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let separator = UIView()
    private lazy var moreProductButton = UIButton()
    private let separatorView = UIView()
    
    //MARK: - Life Cycle
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
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
            $0.setTitle("28개  더 보기", for: .normal)
            $0.setTitleColor(.tossGrey300, for: .normal)
            $0.titleLabel?.textAlignment = .center
            $0.titleLabel?.font = .tossBody2
            $0.backgroundColor = .tossWhite
        }
        
        separatorView.do {
            $0.backgroundColor = .tossGrey100
        }
    }
    
    private func hierarchy() {
        self.addSubviews(separator,moreProductButton,separatorView)
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
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(self.moreProductButton.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(15)
        }
    }
}



