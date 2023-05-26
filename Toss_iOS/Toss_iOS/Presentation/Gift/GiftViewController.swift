//
//  GiftViewController.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

class GiftViewController: UIViewController {

    //MARK: - UI Components
    //scrollview 구현
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var itemMainView = UIView()
    
    private var itemInfoView = UIView()
    private lazy var infoButton = UIButton()
    private lazy var reviewButton = UIButton()
    private lazy var rectanglebarView = UIView(frame: originFrame)
    private var checkInfo = true
    
    private var itemEtcView = UIView()
    private var expirydateLabel = UILabel()
    private var noticeButton = UIButton()
    private var brandconButton = UIButton()
    
    //상단 고정영역
    private var topNavBar = UIView()
    private var backButton = UIButton()
    private var searchButton = UIButton()
    private var heartButton = UIButton()
    
    //하단 고정영역
    private var bottomNavBar = UIView()
    private var buyButton = UIButton()
    private var giftButton = UIButton()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addContentView() //먼저 안하면 에러남 어이없음
        setStyle()
        setLayout()
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    //MARK: - Custom Method
    func addContentView() {
        view.addSubviews(scrollView, bottomNavBar, topNavBar)
        scrollView.addSubview(contentView)
        contentView.addSubviews(itemMainView, itemInfoView, itemEtcView,rectanglebarView)
        itemInfoView.addSubviews(infoButton, reviewButton)
        itemEtcView.addSubviews(expirydateLabel, noticeButton, brandconButton)
        topNavBar.addSubviews(backButton, searchButton, heartButton)
        bottomNavBar.addSubviews(giftButton,buyButton)
    }
    
    func setStyle() {
        view.backgroundColor = .tossWhite
        
        topNavBar.do {
            $0.backgroundColor = .tossWhite
            
            backButton.do {
                $0.setImage(Image.backArrow, for: .normal)
                $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
            }
            searchButton.do {
                $0.setImage(Image.search, for: .normal)
            }
            heartButton.do {
                $0.setImage(Image.heart, for: .normal)
                $0.setImage(Image.heartFilled, for: .selected)
                
                $0.addTarget(self, action: #selector(heartBtnTap), for: .touchUpInside)
            }
        }
        
        contentView.do {
            $0.backgroundColor = .tossGrey200
        }
        itemMainView.do {
            $0.backgroundColor = .tossWhite
        }
        itemInfoView.do {
            $0.backgroundColor = .tossWhite
            
            infoButton.do {
                $0.backgroundColor = .tossWhite
                $0.setTitle("상품정보", for: .normal)
                $0.titleLabel?.font = .tossTitle2
                $0.titleLabel?.textAlignment = .center
                if(checkInfo){
                    $0.setTitleColor(UIColor(hex: 0x191919), for: .normal)
                }
                else {
                    $0.setTitleColor(UIColor(hex: 0x999999), for: .normal)
                }
                $0.addTarget(self, action: #selector(infoBtnTap), for: .touchUpInside)
            }
            reviewButton.do {
                $0.backgroundColor = .tossWhite
                $0.setTitle("후기", for: .normal)
                $0.titleLabel?.font = .tossTitle2
                $0.titleLabel?.textAlignment = .center
                if(checkInfo){
                    $0.setTitleColor(UIColor(hex: 0x999999), for: .normal)
                }
                else {
                    $0.setTitleColor(UIColor(hex: 0x191919), for: .normal)
                }
                $0.addTarget(self, action: #selector(infoBtnTap), for: .touchUpInside)
            }
            rectanglebarView.do {
                $0.backgroundColor = .black
                $0.layer.cornerRadius = 3
            }
        }
        itemEtcView.do {
            $0.backgroundColor = .tossWhite
            
            expirydateLabel.do {
                $0.text = "유효기간"
                $0.font = .tossTitle2
                $0.textColor = .tossGrey400
            }
            noticeButton.do {
                $0.backgroundColor = .tossWhite
            }
            brandconButton.do {
                $0.backgroundColor = .tossWhite
            }
        }
        
        bottomNavBar.do {
            $0.backgroundColor = .tossWhite
            
            buyButton.do {
                $0.backgroundColor = .tossLightblue
                $0.setTitle("구매하기", for: .normal)
                $0.titleLabel?.font = .tossMedium18
                $0.setTitleColor(.tossBlue, for: .normal)
                $0.titleLabel?.textAlignment = .center
                $0.makeCornerRound(radius: 16)
            }
            giftButton.do {
                $0.backgroundColor = .tossBlue
                $0.setTitle("선물하기", for: .normal)
                $0.titleLabel?.font = .tossMedium18
                $0.setTitleColor(.tossLightblue, for: .normal)
                $0.titleLabel?.textAlignment = .center
                $0.makeCornerRound(radius: 16)
                $0.addTarget(self,
                             action: #selector(giftButtonTap),
                             for: .touchUpInside)
            }
        }
    }
    
    func setLayout() {
        topNavBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(42)
            
            backButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(16)
                $0.size.equalTo(24)
            }
            searchButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(heartButton.snp.leading).offset(-22)
            }
            heartButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(22)
                $0.size.equalTo(24)
            }
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(topNavBar.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(bottomNavBar.snp.top)
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        itemMainView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(599)
        }
        
        itemInfoView.snp.makeConstraints {
            $0.top.equalTo(itemMainView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(188)
            
            infoButton.snp.makeConstraints {
                $0.top.leading.equalToSuperview()
                $0.width.equalTo(187.5)
                $0.height.equalTo(58)
            }
            reviewButton.snp.makeConstraints {
                $0.top.trailing.equalToSuperview()
                $0.width.equalTo(187.5)
                $0.height.equalTo(58)
            }
            rectanglebarView.snp.makeConstraints {
                $0.top.equalTo(infoButton.snp.bottom)
                $0.leading.equalToSuperview().offset(60)
                $0.width.equalTo(67)
                $0.height.equalTo(3)
            }
        }
        
        itemEtcView.snp.makeConstraints {
            $0.top.equalTo(itemInfoView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(242)
            $0.bottom.equalToSuperview()
            
            expirydateLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(28)
                $0.leading.equalToSuperview().offset(22)
            }
        }
        
        bottomNavBar.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(87)
            
            buyButton.snp.makeConstraints {
                $0.top.equalToSuperview().inset(2)
                $0.leading.equalToSuperview().inset(19)
                $0.width.equalTo(164)
                $0.height.equalTo(55)
            }
            giftButton.snp.makeConstraints {
                $0.top.equalTo(buyButton.snp.top)
                $0.trailing.equalToSuperview().inset(19)
                $0.width.equalTo(164)
                $0.height.equalTo(55)
            }
        }
        
    }
    
    @objc
    func infoBtnTap() {
        checkInfo.toggle()
        if(checkInfo){
            infoButton.setTitleColor(UIColor(hex: 0x191919), for: .normal)
            reviewButton.setTitleColor(UIColor(hex: 0x999999), for: .normal)
            rectangleResetAnimation()
        }
        else {
            infoButton.setTitleColor(UIColor(hex: 0x999999), for: .normal)
            reviewButton.setTitleColor(UIColor(hex: 0x191919), for: .normal)
            rectangleAnimation()
        }
    }
    
    @objc
    func heartBtnTap() {
        heartButton.isSelected.toggle()
        GiftAPI.shared.patchHeart { result in
            print("data response를 받았습니다")
        }
    }
    
    let originFrame = CGRect(x: 60, y: 0, width: 67, height: 3)
    let newFrame = CGRect(x: 100, y: 0, width: 67, height: 3)
    
    func rectangleAnimation() {
        rectanglebarView.snp.remakeConstraints {
            $0.centerX.equalTo(reviewButton.snp.centerX)
            $0.bottom.equalTo(reviewButton.snp.bottom)
            $0.width.equalTo(reviewButton.titleLabel!.snp.width)
            $0.height.equalTo(3)
        }
        UIView.animate(withDuration: 0.5) { [self] in
            
            self.rectanglebarView.superview?.layoutIfNeeded()
        }
    }
    
    func rectangleResetAnimation() {
        rectanglebarView.snp.remakeConstraints {
            $0.centerX.equalTo(infoButton.snp.centerX)
            $0.bottom.equalTo(reviewButton.snp.bottom)
            $0.width.equalTo(infoButton.titleLabel!.snp.width)
            $0.height.equalTo(3)
        }
        UIView.animate(withDuration: 0.5) { [self] in
            self.rectanglebarView.superview?.layoutIfNeeded()
        }
    }
    
    @objc
    func giftButtonTap() {
        let giftcardVC = GiftcardViewController()
        self.navigationController?.pushViewController(giftcardVC, animated: true)
    }
    
    @objc
    func backButtonDidTap() {
        self.dismiss(animated: true)
    }
}

