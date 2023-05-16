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
    public let scrollView = UIScrollView()
    private let searchView = PaySearchView()
    private let separator1 = UIView()
    public let productCollectionView = PayProductCollectionView()
    public let brandConCollectionView = PayBrandConCollectionView()
    public let popularConTableView = PayPopularConTableView()
    private let separator2 = UIView()
    public let cashBackTableView = PayCashBackTableView()
    private let separator3 = UIView()
    public let popularBrandTableView = PayPopularBrandTableView()
    
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
        scrollView.do {
            $0.backgroundColor = .tossWhite
            $0.isScrollEnabled = true
            $0.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2044)
        }
        
        separator1.backgroundColor = .tossGrey100
        separator2.backgroundColor = .tossGrey100
        separator3.backgroundColor = .tossGrey100
    }
    
    private func hierarchy() {
        self.addSubviews(
            navigationView,
            scrollView)
        scrollView.addSubviews(searchView,
                               productCollectionView,
                               separator1,
                               brandConCollectionView,
                               popularConTableView,
                               separator2,
                               cashBackTableView,
                               separator3,
                               popularBrandTableView)
            
    }
    
    private func layout() {
        navigationView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(38)
        }
        
        scrollView.snp.makeConstraints {
               $0.top.equalTo(self.navigationView.snp.bottom)
               $0.width.equalToSuperview()
               $0.bottom.equalToSuperview()
           }
        
        searchView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(112)
        }
        
        productCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.searchView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(489)
        }
        
        separator1.snp.makeConstraints {
            $0.top.equalTo(self.productCollectionView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(15)
        }
        
        brandConCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.separator1.snp.bottom)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(278)
        }
        
        popularConTableView.snp.makeConstraints {
            $0.top.equalTo(self.brandConCollectionView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(284)
        }
        
        separator2.snp.makeConstraints {
            $0.top.equalTo(self.popularConTableView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(15)
        }
        
        cashBackTableView.snp.makeConstraints {
            $0.top.equalTo(self.separator2.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(343)
        }
        
        separator3.snp.makeConstraints {
            $0.top.equalTo(self.cashBackTableView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(15)
        }
        
        popularBrandTableView.snp.makeConstraints {
            $0.top.equalTo(self.separator3.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(500)
            $0.bottom.equalToSuperview()
        }
    }
}


