//
//  GiftViewController.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/16.
//

import UIKit

import Kingfisher
import SnapKit
import Then

class GiftViewController: BaseViewController {
    
    // MARK: - Property
    
    private var productData: GiftproductModel?
    
    // MARK: - UI Components
    
    //scrollview 구현
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var itemMainView = UIView()
    
    private var itemInfoView = UIView()
    private var itemInfotextLabel = UILabel()
    private var itemInfoText : String?
    private lazy var itemInfoButton = UIButton()
    private lazy var itemReviewButton = UIButton()
    private lazy var itemRectangleBarView = UIView(frame: originFrame)
    private var itemInfoCheck = true
    
    private var productInfoView = UIView()
    private var productImage = UIImageView()
    private var productbrandLabel = UILabel()
    private var productnameLabel = UILabel()
    private var productpriceLabel = UILabel()
    
    private var cashbackView = UIView()
    private var cashbackIcon = UIImageView()
    private var cashbackMessageLabel = UILabel()
    private var cashbackPointLabel = UILabel()
    
    private var expirydateNameLabel = UILabel()
    private var expirydateNumberLabel = UILabel()
    private var noticeNameButton = UIButton()
    private var brandconNameButton = UIButton()
    
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
        
        addContentView()
        setStyle()
        setLayout()
        requestGiftAPI() 
    }
    
    // MARK: - AddContent
    
    func addContentView() {
        view.addSubviews(scrollView, bottomNavBar, topNavBar)
        scrollView.addSubview(contentView)
        contentView.addSubviews(itemMainView, itemInfoView, productInfoView,
                                itemRectangleBarView,
                                productImage,productbrandLabel, productnameLabel, productpriceLabel,
                                cashbackView)
        cashbackView.addSubviews(cashbackIcon, cashbackMessageLabel, cashbackPointLabel)
        itemInfoView.addSubviews(itemInfoButton, itemReviewButton, itemInfotextLabel)
        productInfoView.addSubviews(expirydateNameLabel, expirydateNumberLabel,
                                noticeNameButton, brandconNameButton)
        topNavBar.addSubviews(backButton, searchButton, heartButton)
        bottomNavBar.addSubviews(giftButton, buyButton)
    }
    
    // MARK: - Style
    
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
                
                $0.addTarget(self, action: #selector(heartButtonTap), for: .touchUpInside)
            }
        }
        
        contentView.do {
            $0.backgroundColor = .tossGrey200
        }
        itemMainView.do {
            $0.backgroundColor = .tossWhite
            
            productImage.do {
                $0.image = Image.coffee
            }
            productbrandLabel.do {
                //$0.text = "메가MGC커피"
                $0.font = .tossBody1
                $0.textColor = .tossGrey400
            }
            productnameLabel.do {
                //$0.text = "ime"
                $0.font = .tossSubTitle
                $0.textColor = .tossGrey500
            }
            productpriceLabel.do {
                //$0.text = "2,000원"
                $0.font = .tossHeader1
                $0.textColor = .tossGrey500
            }
            cashbackView.do {
                $0.backgroundColor = .tossWhite
                
                cashbackIcon.do {
                    $0.image = Image.point
                }
                cashbackMessageLabel.do {
                    $0.text = "3% 캐시백드려요"
                    $0.font = .tossSubTitle
                    $0.textColor = UIColor(hex: 0x6D7582)
                }
                cashbackPointLabel.do {
                    $0.text = "60원"
                    $0.font = .tossTitle2
                    $0.textColor = .tossBlue
                }
            }
        }
        
        itemInfoView.do {
            $0.backgroundColor = .tossWhite
            
            itemInfoButton.do {
                $0.backgroundColor = .tossWhite
                $0.setTitle("상품정보", for: .normal)
                $0.titleLabel?.font = .tossTitle2
                $0.titleLabel?.textAlignment = .center
                if(itemInfoCheck){
                    $0.setTitleColor(UIColor(hex: 0x191919), for: .normal)
                }
                else {
                    $0.setTitleColor(UIColor(hex: 0x999999), for: .normal)
                }
                $0.addTarget(self, action: #selector(infoButtonTap), for: .touchUpInside)
            }
            itemReviewButton.do {
                $0.backgroundColor = .tossWhite
                $0.setTitle("후기", for: .normal)
                $0.titleLabel?.font = .tossTitle2
                $0.titleLabel?.textAlignment = .center
                if(itemInfoCheck){
                    $0.setTitleColor(UIColor(hex: 0x999999), for: .normal)
                }
                else {
                    $0.setTitleColor(UIColor(hex: 0x191919), for: .normal)
                }
                $0.addTarget(self, action: #selector(infoButtonTap), for: .touchUpInside)
            }
            itemInfotextLabel.do {
                //checkInfo = true
                $0.text = itemInfoText
                $0.textColor = UIColor.init(hex: 0x6D7582)
                $0.font = .tossBody1
                $0.numberOfLines = 2
                $0.textAlignment = .left
            }
            itemRectangleBarView.do {
                $0.backgroundColor = .black
                $0.layer.cornerRadius = 3
            }
        }
        
        productInfoView.do {
            $0.backgroundColor = .tossWhite
            
            expirydateNameLabel.do {
                $0.text = "유효기간"
                $0.font = .tossTitle2
                $0.textColor = .tossGrey400
            }
            expirydateNumberLabel.do {
                //$0.text = "366일"
                $0.font = .tossTitle2
                $0.textColor = .tossGrey400
            }
            noticeNameButton.do {
                $0.backgroundColor = .tossWhite
                $0.setTitle("메가MGC커피 유의사항", for: .normal)
                $0.setTitleColor(.tossGrey400, for: .normal)
                $0.titleLabel?.font = .tossBody1
                $0.titleLabel?.textAlignment = .left
                $0.titleEdgeInsets = .init(top: 10, left: 19, bottom: 10, right: 210)
            }
            brandconNameButton.do {
                $0.backgroundColor = .tossWhite
                $0.setTitle("브랜드콘 안내", for: .normal)
                $0.setTitleColor(.tossGrey400, for: .normal)
                $0.titleLabel?.font = .tossBody1
                $0.titleLabel?.textAlignment = .left
                $0.titleEdgeInsets = .init(top: 10, left: 15, bottom: 10, right: 270)
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
    
    // MARK: - Layout
    
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
        
        itemMainView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(599)
            
            productImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(45)
                $0.width.equalToSuperview()
                $0.height.equalTo(329)
            }
            productbrandLabel.snp.makeConstraints {
                $0.top.equalTo(productImage.snp.bottom).offset(27)
                $0.leading.equalToSuperview().inset(26)
            }
            productnameLabel.snp.makeConstraints {
                $0.top.equalTo(productbrandLabel.snp.bottom).offset(10)
                $0.leading.equalToSuperview().inset(22)
            }
            productpriceLabel.snp.makeConstraints {
                $0.top.equalTo(productnameLabel.snp.bottom).offset(22)
                $0.leading.equalTo(productnameLabel.snp.leading)
            }
            cashbackView.snp.makeConstraints {
                $0.width.equalToSuperview()
                $0.top.equalTo(productpriceLabel.snp.bottom).offset(38)
                $0.height.equalTo(23)
                
                cashbackIcon.snp.makeConstraints {
                    $0.leading.equalToSuperview().inset(22)
                    $0.centerY.equalToSuperview()
                    $0.size.equalTo(22)
                }
                cashbackMessageLabel.snp.makeConstraints {
                    $0.leading.equalTo(cashbackIcon.snp.trailing).offset(16)
                    $0.centerY.equalToSuperview()
                }
                cashbackPointLabel.snp.makeConstraints {
                    $0.trailing.equalToSuperview().inset(24)
                    $0.centerY.equalToSuperview()
                }
            }
        }
        
        itemInfoView.snp.makeConstraints {
            $0.top.equalTo(itemMainView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(188)
            
            itemInfoButton.snp.makeConstraints {
                $0.top.leading.equalToSuperview()
                $0.width.equalTo(187.5)
                $0.height.equalTo(58)
            }
            itemReviewButton.snp.makeConstraints {
                $0.top.trailing.equalToSuperview()
                $0.width.equalTo(187.5)
                $0.height.equalTo(58)
            }
            itemInfotextLabel.snp.makeConstraints {
                $0.top.equalTo(itemInfoButton.snp.bottom)
                $0.leading.equalToSuperview().inset(22)
                $0.bottom.equalToSuperview()
            }
            itemRectangleBarView.snp.makeConstraints {
                $0.top.equalTo(itemInfoButton.snp.bottom)
                $0.leading.equalToSuperview().offset(60)
                $0.width.equalTo(67)
                $0.height.equalTo(3)
            }
        }
        
        productInfoView.snp.makeConstraints {
            $0.top.equalTo(itemInfoView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(242)
            $0.bottom.equalToSuperview()
            
            expirydateNameLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(28)
                $0.leading.equalToSuperview().offset(22)
            }
            expirydateNumberLabel.snp.makeConstraints {
                $0.top.equalTo(expirydateNameLabel.snp.top)
                $0.trailing.equalToSuperview().inset(22)
            }
            noticeNameButton.snp.makeConstraints {
                $0.top.equalTo(expirydateNumberLabel.snp.bottom).offset(25)
                $0.width.equalToSuperview()
                $0.height.equalTo(40)
            }
            brandconNameButton.snp.makeConstraints {
                $0.top.equalTo(noticeNameButton.snp.bottom).offset(16)
                $0.width.equalToSuperview()
                $0.height.equalTo(40)
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
    
    // MARK: - Actions
    
    @objc
    func infoButtonTap() {
        itemInfoCheck.toggle()
        if(itemInfoCheck){
            itemInfoButton.setTitleColor(UIColor(hex: 0x191919), for: .normal)
            itemReviewButton.setTitleColor(UIColor(hex: 0x999999), for: .normal)
            rectangleResetAnimation()
            itemInfotextLabel.text = itemInfoText
        }
        else {
            itemInfoButton.setTitleColor(UIColor(hex: 0x999999), for: .normal)
            itemReviewButton.setTitleColor(UIColor(hex: 0x191919), for: .normal)
            rectangleAnimation()
            itemInfotextLabel.text = ""
        }
    }
    
    @objc
    func heartButtonTap() {
        heartButton.isSelected.toggle()
        GiftAPI.shared.patchHeart { result in
            print("data response를 받았습니다")
        }
    }
    
    let originFrame = CGRect(x: 60, y: 0, width: 67, height: 3)
    let newFrame = CGRect(x: 100, y: 0, width: 67, height: 3)
    
    func rectangleAnimation() {
        itemRectangleBarView.snp.remakeConstraints {
            $0.centerX.equalTo(itemReviewButton.snp.centerX)
            $0.bottom.equalTo(itemReviewButton.snp.bottom)
            $0.width.equalTo(itemReviewButton.titleLabel!.snp.width)
            $0.height.equalTo(3)
        }
        UIView.animate(withDuration: 0.5) { [self] in
            
            self.itemRectangleBarView.superview?.layoutIfNeeded()
        }
    }
    
    func rectangleResetAnimation() {
        itemRectangleBarView.snp.remakeConstraints {
            $0.centerX.equalTo(itemInfoButton.snp.centerX)
            $0.bottom.equalTo(itemReviewButton.snp.bottom)
            $0.width.equalTo(itemInfoButton.titleLabel!.snp.width)
            $0.height.equalTo(3)
        }
        UIView.animate(withDuration: 0.5) { [self] in
            self.itemRectangleBarView.superview?.layoutIfNeeded()
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

// MARK: - GIftViewDataSource

extension GiftViewController {
    func requestGiftAPI() {
        GiftAPI.shared.getProduct { result in
            guard let result = self.validateResult(result) as? GiftproductModel else { return }
            self.productData = result
            self.dataBind(self.productData)
        }
    }
    
    func dataBind(_ productData: GiftproductModel?) {
        //productImage.kfSetImage(url: productData?.imageURL)
        guard let productData = self.productData else { return }
        productbrandLabel.text = productData.brandTitle
        productnameLabel.text = productData.productTitle
        productpriceLabel.text = String(productData.price ?? 0) + "원"
        cashbackPointLabel.text = String(productData.point ?? 0) + "원"
        expirydateNumberLabel.text = String(productData.expiration ?? 0) + "일"
        itemInfotextLabel.text = productData.productInfo
        itemInfoText = productData.productInfo
        
        let heart = productData.like ? Image.heartFilled : Image.heart
        if(heart == Image.heart){
            heartButton.isSelected = false
        }
        else {
            heartButton.isSelected = true
        }
    }
}
