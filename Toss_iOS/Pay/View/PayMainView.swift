//
//  PayMainView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayMainView: UIView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let navigationView = PayNavigationView()
    private let searchView = PaySearchView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func hierarchy() {
        self.addSubviews(
            navigationView,
            searchView
        )
    }
    
    private func layout() {
        navigationView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(38)
        }
        
        searchView.snp.makeConstraints {
            $0.top.equalTo(self.navigationView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(112)
        }
    }
}


