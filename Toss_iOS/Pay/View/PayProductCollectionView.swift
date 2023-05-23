//
//  PayProductCollectionView.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayProductCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    let layout = PayCollectionViewLayout.product.createLayout()
    
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
            PayProductCollectionViewCell.self,
            forCellWithReuseIdentifier: PayProductCollectionViewCell.cellIdentifier
        )
        
        self.register(
            PayProductCollectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: PayProductCollectionHeaderView.reuseCellIdentifier
        )
        
        self.register(
            PayProductCollectionFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: PayProductCollectionFooterView.reuseCellIdentifier
        )
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

