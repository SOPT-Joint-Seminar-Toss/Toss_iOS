//
//  PayViewController.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class PayViewController : BaseViewController{
    
    //MARK: - Properties
    
    private let productMockData = Product.mockDummy()
    
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
    }
    
    //MARK: - Action Method
    
}

extension PayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 375)
    }
}

extension PayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productMockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PayProductCollectionViewCell.cellIdentifier, for: indexPath) as? PayProductCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(productMockData[indexPath.item])
        return cell
    }
}
