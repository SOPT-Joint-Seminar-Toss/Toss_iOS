//
//  ConsumptionSectionView.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/23.
//

import UIKit

class ConsumptionSectionView : UIView {
    //MARK: - UI Components
    private let contentView = UIView().then {
        $0.backgroundColor = .tossWhite
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "소비"
        $0.font = .spoqaHanSanNeo(.bold, size: 22)
        $0.textColor = UIColor(hex: 0x000000)
    }
    
    lazy var stockContentView = UIView().then {
        $0.backgroundColor = .tossWhite
    }
    lazy var stockTitleLabel = UILabel().then {
        $0.text = "주식"
        $0.font = .spoqaHanSanNeo(.medium, size: 14)
        $0.textColor = .tossGrey400
    }
    
    lazy var stockSubTitleLabel = UILabel().then {
        $0.text = "123,456,789 원"
        $0.font = .spoqaHanSanNeo(.bold, size: 18)
        $0.textColor = .tossGrey500
    }
    
    lazy var stockButton = UIButton().then {
        $0.setTitle("내역", for: .normal)
        $0.setTitleColor(UIColor(hex: 0x505866), for: .normal)
        $0.titleLabel?.font = .spoqaHanSanNeo(.medium, size: 14)
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(hex: 0xF2F4F6)
    }
    
    private let separateView = UIView().then {
        $0.backgroundColor = .tossGrey100
    }
    
    lazy var stockMainImageView = UIImageView().then {
        $0.image = Image.card
    }
    
    private let stockBackView = UIView()
    
    
    private let consumptionCardView = MainSectionCellView(
        title: "5월 15일 낼 카드값",
        subTitle: "123,456 원",
        buttonHidden: true,
        buttonTitle: "",
        mainImage: Image.icnDday,
        subImage: UIImage(),
        doubleImage: false)
    
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
        self.backgroundColor = .tossWhite
    }
    private func setLayout() {
        self.addSubview(contentView)
        contentView.addSubviews(titleLabel, stockButton, stockBackView, separateView, consumptionCardView)
        stockBackView.addSubviews(stockMainImageView, stockTitleLabel, stockSubTitleLabel)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().inset(40)
            $0.height.equalTo(24)
        }
        stockButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(28)
            $0.width.equalTo(52)
        }
        stockBackView.snp.makeConstraints {
            $0.height.equalTo(42)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
        }
        stockMainImageView.snp.makeConstraints {
            $0.height.width.equalTo(40)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        stockTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(stockMainImageView.snp.trailing).offset(16)
        }
        separateView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(stockBackView.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        consumptionCardView.snp.makeConstraints {
            $0.top.equalTo(separateView.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        stockSubTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(stockMainImageView.snp.trailing).offset(16)
            $0.bottom.equalToSuperview()
        }
    }
}
