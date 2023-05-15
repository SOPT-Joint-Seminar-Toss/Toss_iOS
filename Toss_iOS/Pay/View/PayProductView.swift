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
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
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
        
        self.register(PayProductCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PayProductCollectionHeaderView.reuseCellIdentifier)
    }
    
    private func style() {
        self.do{
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 16 // 상하간격
            layout.scrollDirection = .vertical
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = true
            $0.collectionViewLayout = layout
            $0.contentInsetAdjustmentBehavior = .never
            $0.backgroundColor = .tossWhite
        }
    }
}


