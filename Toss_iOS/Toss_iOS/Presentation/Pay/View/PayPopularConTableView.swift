//
//  PayPopularConTableView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class PayPopularConTableView: UITableView {
    
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
            $0.rowHeight = 82
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
    
    private func register() {
        self.register(PayPopularConTableViewCell.self, forCellReuseIdentifier: PayPopularConTableViewCell.cellIdentifier)
        
        self.register(PayPopularConTableHeaderView.self, forHeaderFooterViewReuseIdentifier: PayPopularConTableHeaderView.cellIdentifier)
    }
}
