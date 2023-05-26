//
//  MainViewController.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/20.
//

import UIKit


class MainViewController : UIViewController {
    //MARK: - Properties
    var overTabView : Bool = true
    //MARK: - UI Components
    private var mainView = MainView()
    
    private let tossMainButton = UIButton().then {
        $0.setImage(Image.logoToss, for: .normal)
    }
    private let alarmButton = UIButton().then {
        $0.setImage(Image.alarm, for: .normal)
    }
    private let menuButton = UIButton().then {
        $0.setImage(Image.menu, for: .normal)
    }
    
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        mainView = MainView(frame: self.view.frame)
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        MainAssetManager().getMainAsset(self)
    }
    //MARK: - Custom Method
    private func setLayout() {
        
    }
    private func setUI(){
        mainView.scrollView.delegate = self
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = tossMainButton
        let rightBarLeftButton = UIBarButtonItem()
        rightBarLeftButton.customView = alarmButton
        let rightBarRightButton = UIBarButtonItem()
        rightBarRightButton.customView = menuButton
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItems = [rightBarRightButton, rightBarLeftButton]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    // MARK: - ACTIONS
}
// MARK: - EXTENSIONs
extension MainViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        let contentSize = scrollView.contentSize
        guard let tabBarHeight = tabBarController?.tabBar.frame.size.height else { return }
        let currentHeight = Int(contentOffset.y + scrollView.frame.size.height - tabBarHeight)
        let currentY = contentOffset.y
//        print("Current height: \(currentHeight)")

        print(mainView.tabConsumptionSectionView.frame.origin.y, "오호")
        var trigger : Bool = false
        
        if currentHeight >= 1045  {
            overTabView = false
        }
        else if currentHeight < 1045 {
            overTabView = true
        }

        if currentHeight > 1030 && currentHeight < 1060 {
            trigger = true
        }
        
        if overTabView == true && trigger == true {
            tabBarAnimation()
        }
        else if overTabView == false && trigger == true {
            scrollAnimation()
        }
        
        
        
        
        
        
        
        
        
        func tabBarAnimation() {
            self.mainView.tabConsumptionSectionView.snp.remakeConstraints {
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(260)
                $0.bottom.equalToSuperview().offset(113)
            }
            self.mainView.tabConsumptionSectionView.titleLabel.snp.remakeConstraints {
                $0.top.equalTo(self.mainView.tabConsumptionSectionView.snp.top).offset(25)
                $0.leading.equalToSuperview().inset(40)
            }
            self.mainView.tabConsumptionSectionView.stockButton.snp.remakeConstraints {
                $0.centerY.equalTo(mainView.tabConsumptionSectionView.titleLabel.snp.centerY)
                $0.height.equalTo(28)
                $0.width.equalTo(52)
                $0.trailing.equalToSuperview().inset(40)
            }

            self.mainView.tabConsumptionSectionView.layer.opacity = 1
            UIView.animate(withDuration: 0.3) {
                self.mainView.tabConsumptionSectionView.superview?.layoutIfNeeded()
                trigger = false
            } completion: { _ in
                self.mainView.tabConsumptionSectionView.isUserInteractionEnabled = true // <- 요거 트러블 슈팅
            }
        }
        
        func scrollAnimation() {
            self.mainView.tabConsumptionSectionView.snp.remakeConstraints {
                $0.top.equalTo(self.mainView.consumptionSectionView.snp.top)
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(260)
            }
            self.mainView.tabConsumptionSectionView.titleLabel.snp.remakeConstraints {
                $0.top.equalTo(self.mainView.tabConsumptionSectionView.snp.top).offset(25)
                $0.leading.equalTo(self.mainView.consumptionSectionView.snp.leading).offset(24)
            }
            self.mainView.tabConsumptionSectionView.stockButton.snp.remakeConstraints {
                $0.centerY.equalTo(mainView.tabConsumptionSectionView.stockMainImageView.snp.centerY)
                $0.trailing.equalTo(self.mainView.consumptionSectionView.snp.trailing).offset(-24)
                $0.height.equalTo(28)
                $0.width.equalTo(52)
            }

            UIView.animate(withDuration: 0.3) {
                self.mainView.tabConsumptionSectionView.superview?.layoutIfNeeded()
                trigger = false
            } completion: { _ in
                self.mainView.tabConsumptionSectionView.isUserInteractionEnabled = false // <- 요거 트러블 슈팅
                print("이거 땜인가")
            }

        }
    }
}
extension MainViewController {
    func getMainAssetResponse(_ response : MainAssetResponse) {
        self.mainView.assetTossBankView.titleLabel.text = response.data[0].title ?? ""
        self.mainView.assetTossBankView.subTitleLabel.text = "\((response.data[0].balance ?? 0).addCommas()) 원"
        self.mainView.assetSavingMoneyView.titleLabel.text = response.data[1].title ?? ""
        self.mainView.assetSavingMoneyView.subTitleLabel.text = "\((response.data[1].balance ?? 0).addCommas()) 원"
        self.mainView.assetKbBankView.titleLabel.text = response.data[2].title ?? ""
        self.mainView.assetKbBankView.subTitleLabel.text = "\((response.data[2].balance ?? 0).addCommas()) 원"
    }
}
//소비 섹션이 딱 나타나는 높이 : 985
// 소비 텍스트까지는 1010

extension Int {
    func addCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
