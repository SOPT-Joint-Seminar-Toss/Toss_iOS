//
//  MainView.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/18.
//

import UIKit
import SnapKit
import Then


class MainView: UIView {
    //MARK: - Properties

    //MARK: - UI Components
    private let scrollView = UIScrollView()
    
    private let scrollContentView = UIView()
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    private func setUI() {
        self.backgroundColor = .tossGrey100
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
    }
    
    private func setLayout() {
        self.addSubview(scrollView)

        
    }
}
