//
//  PayBrandConView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/16.
//


import UIKit

import SnapKit
import Then

final class PayBrandConCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    let layout = PayCollectionViewLayout.brand.createLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: self.layout)
        
        register()
        
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        self.register(
            PayBrandConCollectionViewCell.self,
            forCellWithReuseIdentifier: PayBrandConCollectionViewCell.cellIdentifier
        )
        
        self.register(
            PayBrandConCollectionViewHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: PayBrandConCollectionViewHeaderView.reuseCellIdentifier)
    }
    
    private func style() {
        self.do{
            $0.isScrollEnabled = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
            $0.backgroundColor = .tossWhite
        }
    }
}



