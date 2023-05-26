//
//  MainView.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/20.
//

import UIKit
import SnapKit
import Then


class MainView: UIView {
    //MARK: - Properties

    //MARK: - UI Components
    
    let scrollView = UIScrollView()
    
    let scrollContentView = UIView()
    
    
    private let tossBankSectionView = MainSectionView(title: "토스뱅크", hasPushButton: true).then {
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }
    
    private let pointSectionView = UIView().then {
        $0.backgroundColor = .tossWhite
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }
    private let pointSectionTitleLabel = UILabel().then {
        $0.text = "함께 토스 켜고 포인트 받자"
        $0.font = .spoqaHanSanNeo(.bold, size: 18)
        $0.textColor = UIColor(hex: 0x000000)
    }
    
    let assetSectionView = MainSectionView(title: "자산", hasPushButton: true).then {
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }
    
    let assetTossBankView = MainSectionCellView(
        title: "",
        subTitle: "",
        buttonHidden: false,
        buttonTitle: "송금",
        mainImage: Image.toss,
        subImage: UIImage(),
        doubleImage: false)
    
    let assetSavingMoneyView = MainSectionCellView(
        title: "토스뱅크 돈 모으기",
        subTitle: "123,456 원",
        buttonHidden: true,
        buttonTitle: "",
        mainImage: Image.icnSaving,
        subImage: UIImage(),
        doubleImage: false)
    
    let assetKbBankView = MainSectionCellView(
        title: "KB 국민은행 통장",
        subTitle: "123,456 원",
        buttonHidden: true,
        buttonTitle: "",
        mainImage: Image.kb,
        subImage: UIImage(),
        doubleImage: false)
    
    private let assetStockFirstView =  MainSectionCellView(
        title: "증권 . 4개",
        subTitle: "123,456 원",
        buttonHidden: true,
        buttonTitle: "",
        mainImage: Image.toss,
        subImage: Image.naver,
        doubleImage: true)
    
    private let assetStockSecondView =  MainSectionCellView(
        title: "증권 . 4개",
        subTitle: "123,456 원",
        buttonHidden: true,
        buttonTitle: "",
        mainImage: Image.toss,
        subImage: Image.naver,
        doubleImage: true)
    
    private let assetLoanView = MainSectionCellView(
        title: "대출 . 59개 금융사 대기중",
        subTitle: "내 최대 대출 한도 보기",
        buttonHidden: true,
        buttonTitle: "",
        mainImage: Image.moneyBag,
        subImage: UIImage(),
        doubleImage: false)
    
    private lazy var assetSectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [assetTossBankView, assetSavingMoneyView, assetKbBankView, assetStockFirstView, assetStockSecondView, assetLoanView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 40
        return stackView
    }()
    
    private let investSectionView = MainSectionView(title: "투자", hasPushButton: true).then {
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }
    
    private let investStockView = MainSectionCellView(
        title: "투자",
        subTitle: "123,456 원",
        buttonHidden: true,
        buttonTitle: "",
        mainImage: Image.tesla,
        subImage: Image.apple,
        doubleImage: true)
    
    let tabConsumptionSectionView = ConsumptionSectionView().then {
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }
    let consumptionSectionView = MainSectionView(title: "소비", hasPushButton: true).then {
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }

    
    private let consumptionSeparateView = UIView().then {
        $0.backgroundColor = .tossGrey100
    }
    

    
    private let subSectionScrollView = UIScrollView()
    
    private let subSectionScrollContentView = UIView()
    
    
    private let subGetPointsView = SubSectionView(title: "매일 포인트 \n받기", subTitle: "돈 버는 법", image: Image.point, imageHidden: false).then {
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    private let subMoneyTipsView = SubSectionView(title: "오늘의 \n머니 팁", subTitle: "최근", image: Image.lamp, imageHidden: false).then {
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    private let subCreditScoreView = SubSectionView(title: "신용점수 \n보기", subTitle: "자수", image: UIImage(), imageHidden: false).then {
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    
    private lazy var subSectionStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [subGetPointsView, subMoneyTipsView, subCreditScoreView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    private let screenSettingButton = SubSectionButton(image: Image.setting, title: "화면 설정").then {
        $0.layer.cornerRadius = 16
    }
    private let addAssetButton = SubSectionButton(image: Image.plus, title: "자산 추가").then {
        $0.layer.cornerRadius = 16
    }
    private lazy var subSectionButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [screenSettingButton, addAssetButton])
         stackView.axis = .horizontal
         stackView.distribution = .fill
         stackView.alignment = .fill
         stackView.spacing = 10
         return stackView
     }()
    
    private let privacyPolicyButton = UIButton().then {
        $0.setTitle("개인정보처리방침 보기", for: .normal)
        $0.titleLabel?.font = .spoqaHanSanNeo(.medium, size: 14)
        $0.setTitleColor(.tossGrey200, for: .normal)
    }
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    private func setUI() {
        self.backgroundColor = .tossGrey100
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        subSectionScrollView.translatesAutoresizingMaskIntoConstraints = false
        subSectionScrollView.isUserInteractionEnabled = true
        subSectionScrollView.isScrollEnabled = true
        subSectionScrollView.isUserInteractionEnabled = true
        subSectionScrollView.showsHorizontalScrollIndicator = false

    }
    
    private func setLayout() {

        self.addSubviews(scrollView, tabConsumptionSectionView)
//        consumptionSectionView.addSubview(consumptionSectionStackView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubviews(tossBankSectionView, pointSectionView, pointSectionTitleLabel, assetSectionView, assetSectionStackView, investSectionView, investStockView, consumptionSectionView, subSectionScrollView, subSectionButtonStackView, privacyPolicyButton)
        subSectionScrollView.addSubview(subSectionScrollContentView)
        subSectionScrollContentView.addSubview(subSectionStackView)
        
        tabConsumptionSectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(260)
            $0.bottom.equalToSuperview().offset(113)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollContentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        tossBankSectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(72)
        }
        pointSectionView.snp.makeConstraints {
            $0.top.equalTo(tossBankSectionView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(147)
        }
        pointSectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(pointSectionView.snp.top).offset(24)
            $0.leading.equalTo(pointSectionView.snp.leading).offset(24)
        }
        assetSectionView.snp.makeConstraints {
            $0.top.equalTo(pointSectionView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(567)
        }
        assetSectionStackView.snp.makeConstraints {
            $0.top.equalTo(assetSectionView.titleLabel.snp.bottom).offset(32)
            $0.leading.equalTo(assetSectionView.snp.leading).offset(24)
            $0.trailing.equalTo(assetSectionView.snp.trailing).offset(-24)
        }
        investSectionView.snp.makeConstraints {
            $0.top.equalTo(assetSectionView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(151)
        }
        investStockView.snp.makeConstraints {
            $0.top.equalTo(investSectionView.titleLabel.snp.bottom).offset(32)
            $0.leading.equalTo(assetSectionView.snp.leading).offset(24)
            $0.trailing.equalTo(assetSectionView.snp.trailing).offset(-24)
        }
        consumptionSectionView.snp.makeConstraints {
            $0.top.equalTo(investSectionView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(260)
        }

        subSectionScrollView.snp.makeConstraints {
            $0.height.equalTo(157)
            $0.top.equalTo(consumptionSectionView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        subSectionScrollContentView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        subSectionStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
        
        subSectionButtonStackView.snp.makeConstraints {
            $0.top.equalTo(subSectionScrollView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        screenSettingButton.snp.makeConstraints {
            $0.height.equalTo(55)
            $0.width.equalTo(134)
        }
        addAssetButton.snp.makeConstraints {
            $0.height.equalTo(55)
            $0.width.equalTo(134)
        }
        privacyPolicyButton.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.top.equalTo(subSectionButtonStackView.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(45)
        }
    }
}
