//
//  PayPopularConTableHeaderView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

import SnapKit
import Then

final class PayPopularConTableHeaderView: UITableViewHeaderFooterView {
    
    private let title = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        title.do {
            $0.text = "인기 브랜드콘"
            $0.textColor = .tossGrey500
            $0.font = .tossSubTitle
            $0.textAlignment = .left
        }
    }
    
    private func hierarchy() {
        self.addSubview(title)
    }
    private func layout() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(22)
        }
    }
}
