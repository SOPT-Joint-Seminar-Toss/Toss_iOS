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
    var timer: DispatchSourceTimer?

    var hour: Int = 0
    var minute: Int = 0
    var second: Int  = 0
    
    private let productMockData = Product.mockDummy()
    private let brandConData = BrandCon.mockDummy()
    private let cashMockData = CashBack.mockDummy()
    private let brandMockData = Brand.mockDummy()
    
    private var popularConData: [PopularConResponse] = [] {
        didSet {
            self.rootView.popularConTableView.reloadData()
        }
    }
    
    private var productData: [ProductResponse] = [] {
        didSet {
            self.rootView.productCollectionView.reloadData()
        }
    }
    
    public var index: Int = 0 {
        didSet {
            timer?.cancel()
            timer = nil
            self.endDate = self.productData[self.index].endDate
            self.calculateRemainngTime()
//            self.rootView.productCollectionView.reloadData()
        }
    }
    
    public var endDate: String? {
        didSet {
            startTimer(self.hour, self.minute, self.second)
            self.rootView.productCollectionView.reloadData()
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
        calculateRemainngTime()
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
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(dataReceived),
            name: NSNotification.Name("page"),
            object: nil)
    }
    
    //MARK: - Action Method
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == rootView.popularConTableView && indexPath.row == 0 {
            pushToGiftViewController()
        }
    }
    
    
}

extension PayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case rootView.productCollectionView:
            return productData.count
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
            cell.dataBind(productData[indexPath.item], productMockData[indexPath.item])
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
                header.dataBind(self.endDate)
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
        
        PayAPI.shared.getProduct (completion: { result in
            guard let result = self.validateResult(result) as? [ProductResponse] else {
                print("🍎🍎🍎🍎🍎🍎🍎🍎")
                return
            }
            print("🍏🍏🍏🍏🍏🍏🍏")
            self.productData = result
            self.endDate = self.productData[self.index].endDate
            self.calculateRemainngTime()
            self.rootView.productCollectionView.reloadData()
        })
    }
    
    @objc func dataReceived(notification: NSNotification) {
        guard let page = notification.object as? Int else { return }
        if self.index != page {
            self.index = page
        }
    }
    
    func calculateRemainngTime() {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //1. 주어진 시간 DataFormat으로 바꾸기
        guard let endDate = self.endDate else { return }
        let formatEndDate: String = endDate.replacingOccurrences(of: "T", with: " ")
        print("🔫🔫🔫🔫🔫🔫\(formatEndDate)🔫🔫🔫🔫🔫🔫🔫")
        guard let endTime = format.date(from: formatEndDate) else { return }
        print("🦁🦁🦁🦁🦁🦁\(endTime)🦁🦁🦁🦁🦁🦁🦁")
        
        //2. 현재 시간 DataFormat으로 바꾸기
        
        let currentTime = Date()
        print("🦖🦖🦖🦖🦖🦖🦖\(currentTime)🦖🦖🦖🦖🦖🦖🦖")
        
        
        //3. 두 개 시간 빼주기
        
        let useTime = Int(endTime.timeIntervalSince(currentTime))
        print("🐼🐼🐼🐼🐼🐼🐼\(useTime)🐼🐼🐼🐼🐼🐼🐼🐼")
        
        let hour = useTime / 3600
        let minute = (useTime % 3600) / 60
        let second = (useTime % 3600) % 60
        print("🕊🕊🕊🕊🕊🕊🕊 hour: \(hour)")
        print("🕊🕊🕊🕊🕊🕊🕊 minute: \(minute)")
        print("🕊🕊🕊🕊🕊🕊🕊 second: \(second)")
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    // [실시간 반복 작업 시작 호출]

    func startTimer(_ hour: Int, _ minute: Int, _ second: Int) {
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
            timer?.schedule(deadline: .now(), repeating: 1)
            timer?.setEventHandler(handler: {
                self.timerCallback()
            })
            timer?.resume()
        }
        
    }
    // [실시간 반복 작업 수행 부분]
    func timerCallback() {
        var timeChecker: TimeCheker?
        if self.second > 1 { timeChecker = .second }
        else if self.second <= 1 && self.minute > 0 { timeChecker = .minute }
        else if self.second <= 0 && self.minute <= 0 && self.hour > 0 { timeChecker = .hour }
        else { timeChecker = .end}
        
        self.endDate = timeChecker?.currentTime(hour: self.hour, minute: self.minute, second: self.second)
        
        self.second += timeChecker?.secondResult ?? 0
        self.minute += timeChecker?.minuteResult ?? 0
        self.hour += timeChecker?.hourResult ?? 0
    }
    
    func pushToGiftViewController() {
        let giftViewController = GiftViewController()
        let giftNVC = UINavigationController(rootViewController: giftViewController)
        giftNVC.modalPresentationStyle = .fullScreen
        giftNVC.modalTransitionStyle = .coverVertical
        present(giftNVC, animated: true)
    }
}
