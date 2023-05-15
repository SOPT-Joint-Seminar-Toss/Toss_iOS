//
//  PayNavigationView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayNavigationView: UIView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let settingImageView = UIImageView()
    
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
        settingImageView.do {
            $0.image = Image.setting
        }
    }
    
    private func hierarchy() {
        self.addSubview(settingImageView)
    }
    
    private func layout() {
        settingImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(38)
        }
    }
}
