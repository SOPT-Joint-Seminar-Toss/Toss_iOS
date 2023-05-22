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
    private let popularMockData = PopularConModel.mockDummy()
    private let cashMockData = CashBack.mockDummy()
    private let brandMockData = Brand.mockDummy()
    
    private var popularConData: [PopularConResponse] = [] {
        didSet {
            self.rootView.popularConTableView.reloadData()
        }
    }
    
    //MARK: - UI Components
    
    private let rootView = PayMainView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        requestPay()
        
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.scrollView.delegate = self
        
        rootView.productCollectionView.dataSource = self
        
        rootView.brandConCollectionView.dataSource = self
        
        rootView.popularConTableView.delegate = self
        rootView.popularConTableView.dataSource = self
        
        rootView.cashBackTableView.delegate = self
        rootView.cashBackTableView.dataSource = self
        
        rootView.popularBrandTableView.delegate = self
        rootView.popularBrandTableView.dataSource = self
    }
    
    //MARK: - Action Method
    
}

extension PayViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("yes")
    }
}
extension PayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch tableView {
        case rootView.popularConTableView:
            return 20
        case rootView.cashBackTableView:
            return 68
        case rootView.popularBrandTableView:
            return 66
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch tableView {
        case rootView.cashBackTableView:
            return 56
        case rootView.popularBrandTableView:
            return 56
        default:
            return 0
        }
    }
}

extension PayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case rootView.popularConTableView:
            return popularConData.count
        case rootView.cashBackTableView:
            return cashMockData.count
        case rootView.popularBrandTableView:
            return brandMockData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case rootView.popularConTableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PayPopularConTableViewCell.cellIdentifier, for: indexPath) as? PayPopularConTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.dataBind(popularConData[indexPath.row])
            return cell
        case rootView.cashBackTableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PayCashBackTableViewCell.cellIdentifier, for: indexPath) as? PayCashBackTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.dataBind(cashMockData[indexPath.row])
            return cell
        case rootView.popularBrandTableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PayPopularBrandTableViewCell.cellIdentifier, for: indexPath) as? PayPopularBrandTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.dataBind(brandMockData[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch tableView {
        case rootView.popularConTableView:
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PayPopularConTableHeaderView.cellIdentifier) as? PayPopularConTableHeaderView else { return UIView()}
            return header
        case rootView.cashBackTableView:
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PayCashBackTableHeaderView.cellIdentifier) as?
                    PayCashBackTableHeaderView else { return UIView()}
            return header
        case rootView.popularBrandTableView:
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PayPopularBrandTableHeaderView.cellIdentifier) as?
                    PayPopularBrandTableHeaderView else { return UIView()}
            return header
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch tableView {
        case rootView.cashBackTableView:
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: PayCashBackTableFooterView.cellIdentifier) as? PayCashBackTableFooterView else { return UIView() }
            return footer
        case rootView.popularBrandTableView:
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: PayPopularBrandTableFooterView.cellIdentifier) as? PayPopularBrandTableFooterView else { return UIView() }
            return footer
        default:
            return UIView()
        }
        
    }
    
    
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


extension PayViewController {
    func requestPay() {
        PayAPI.shared.getPopularCon (completion: { result in
            guard let result = self.validateResult(result) as? [PopularConResponse] else {
                print("🍎🍎🍎🍎🍎🍎🍎🍎")
                return
            }
            print("🍏🍏🍏🍏🍏🍏🍏")
            self.popularConData = result
        })
    }
}
