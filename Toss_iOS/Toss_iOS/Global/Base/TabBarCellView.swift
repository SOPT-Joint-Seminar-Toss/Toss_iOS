//
//  TabBarCellView.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/18.
//

import UIKit
import SnapKit
import Then

class TabBarCellView : UIView {
    var tabBarImage: UIImage
    var tabBarTitle: String
    //MARK: - UI Components
    private let tabBarImageView = UIImageView()
    private let tabBarTitleLabel = UILabel().then {
        $0.font = .spoqaHanSanNeo(.medium, size: 10)
        $0.textColor = .tossGrey400
    }
    
    init(tabBarImage: UIImage, tabBarTitle: String) {
        self.tabBarImage = tabBarImage
        self.tabBarTitle = tabBarTitle
        
        super.init(frame: .zero)
        setupLayout()
        setupConstraints()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        tabBarTitleLabel.text = tabBarTitle
        tabBarImageView.image = tabBarImage
    }

    private func setupLayout() {
        /// Override Layout
        /// addSubview
        self.addSubviews(tabBarImageView, tabBarTitleLabel)
    }

    private func setupConstraints() {
        /// Override Constraints
        /// snapkit
        
        tabBarImageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.top.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
        tabBarTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tabBarImageView.snp.bottom).offset(2)
        }
        
    }
}
