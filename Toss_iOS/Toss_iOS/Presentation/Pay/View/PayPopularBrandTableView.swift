//
//  PayPopularBrandTableView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

import SnapKit
import Then

final class PayPopularBrandTableView: UITableView {
    
    //MARK: - Properties
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        tableStyle()
        
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tableStyle() {
        self.do {
            $0.isScrollEnabled = false
            $0.rowHeight = 69
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
    
    private func register() {
        self.register(PayPopularBrandTableViewCell.self, forCellReuseIdentifier: PayPopularBrandTableViewCell.cellIdentifier)
        
        self.register(PayPopularBrandTableHeaderView.self, forHeaderFooterViewReuseIdentifier: PayPopularBrandTableHeaderView.cellIdentifier)
        
        self.register(PayPopularBrandTableFooterView.self, forHeaderFooterViewReuseIdentifier: PayPopularBrandTableFooterView.cellIdentifier)
    }
}

