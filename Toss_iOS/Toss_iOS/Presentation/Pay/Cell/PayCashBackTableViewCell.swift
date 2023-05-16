//
//  PayCashBackTableViewCell.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

import SnapKit
import Then

final class PayCashBackTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    
    private let cashBackImage = UIImageView()
    private let cashBackName = UILabel()
    private let cashBackDescribe = UILabel()
    private lazy var nextButton = UIButton()
    
    //MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellStyle()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func cellStyle() {
        cashBackImage.do {
            $0.makeCornerRound(radius: self.frame.width)
        }
        
        cashBackName.do {
            $0.font = .tossBody1
            $0.textColor = .tossGrey500
            $0.textAlignment = .left
        }
        
        cashBackDescribe.do {
            $0.font = .tossBody3
            $0.textColor = .tossGrey400
            $0.textAlignment = .left
        }
        
        nextButton.do {
            $0.setImage(Image.rightArrow, for: .normal)
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(
            cashBackImage, cashBackName, cashBackDescribe, nextButton
        )
    }
    
    private func layout() {
        cashBackImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(22)
            $0.size.equalTo(38)
        }
        
        cashBackName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.leading.equalTo(self.cashBackImage.snp.trailing).offset(17)
        }
        
        cashBackDescribe.snp.makeConstraints {
            $0.top.equalTo(self.cashBackName.snp.bottom).offset(2)
            $0.leading.equalTo(self.cashBackName)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }
    }
    
    public func dataBind(_ cashBack: CashBack) {
        cashBackImage.image = cashBack.image
        cashBackName.text = cashBack.title
        cashBackDescribe.text = cashBack.describe
    }
}



