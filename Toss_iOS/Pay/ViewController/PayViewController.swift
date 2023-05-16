//
//  PayViewController.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayViewController : BaseViewController {
    
    //MARK: - Properties
    
    private let productMockData = Product.mockDummy()
    private let brandConData = BrandCon.mockDummy()
    
    //MARK: - UI Components
    
    private let rootView = PayMainView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.productCollectionView.delegate = self
        rootView.productCollectionView.dataSource = self
        
        rootView.brandConCollectionView.delegate = self
        rootView.brandConCollectionView.dataSource = self
    }
    
    //MARK: - Action Method
    
}

extension PayViewController: UICollectionViewDelegate {
    
}

extension PayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case rootView.productCollectionView:
            return productMockData.count
        case rootView.brandConCollectionView:
            return brandConData.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rootView.productCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PayProductCollectionViewCell.cellIdentifier, for: indexPath) as? PayProductCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(productMockData[indexPath.item])
            return cell
        case rootView.brandConCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PayBrandConCollectionViewCell.cellIdentifier, for: indexPath) as? PayBrandConCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(brandConData[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch collectionView {
        case rootView.brandConCollectionView:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PayBrandConCollectionViewHeaderView.reuseCellIdentifier, for: indexPath) as? PayBrandConCollectionViewHeaderView else { return UICollectionReusableView()}
            return header
            
        case rootView.productCollectionView:
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier:PayProductCollectionHeaderView.reuseCellIdentifier,
                    for: indexPath
                )as? PayProductCollectionHeaderView else { return UICollectionReusableView() }
                return header
                
            case UICollectionView.elementKindSectionFooter:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PayProductCollectionFooterView.reuseCellIdentifier, for: indexPath)
                        as? PayProductCollectionFooterView else { return UICollectionReusableView() }
                return footer
                
            default:
                return UICollectionReusableView()
            }
            
        default:
            return UICollectionReusableView()
        }
    }
}
