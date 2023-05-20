//
//  MainSectionCellView.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/18.
//

import UIKit
import SnapKit
import Then

class MainSectionCellView: UIView {
    //MARK: - Properties
    var title: String
    var subTitle: String
    var buttonHidden: Bool
    var buttonTitle: String
    var doubleImage : Bool
    var mainImage: UIImage
    var subImage : UIImage
    //MARK: - UI Components
    private let contentView = UIView().then {
        $0.backgroundColor = .tossWhite
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = title
        $0.font = .spoqaHanSanNeo(.medium, size: 14)
        $0.textColor = .tossGrey400
    }
    
    lazy var subTitleLabel = UILabel().then {
        $0.text = subTitle
        $0.font = .spoqaHanSanNeo(.bold, size: 18)
        $0.textColor = .tossGrey500
    }
    
    lazy var mainImageView = UIImageView().then {
        $0.image = mainImage
    }
    lazy var subImageView = UIImageView().then {
        $0.image = subImage
    }
    
    lazy var button = UIButton().then {
        $0.setTitle(buttonTitle, for: .normal)
        $0.setTitleColor(UIColor(hex: 0x505866), for: .normal)
        $0.titleLabel?.font = .spoqaHanSanNeo(.medium, size: 14)
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(hex: 0xF2F4F6)
    }
    
    
    init(title: String, subTitle: String, buttonHidden: Bool, buttonTitle: String, mainImage: UIImage, subImage: UIImage, doubleImage: Bool) {
        self.title = title
        self.subTitle = subTitle
        self.buttonHidden = buttonHidden
        self.buttonTitle = buttonTitle
        self.mainImage = mainImage
        self.doubleImage = doubleImage
        self.subImage = subImage
        super.init(frame: .zero)
        
        setUI()
        setLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Custom Method
    private func setUI() {
        self.backgroundColor = .tossWhite
        button.isHidden = buttonHidden
        
        if doubleImage {
            subImageView.isHidden = false
        }
        else {
            subImageView.isHidden = true
        }
    }
    
    private func setLayout() {
        self.addSubview(contentView)
        contentView.addSubviews(subImageView, mainImageView, titleLabel, subTitleLabel, button)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(42)
        }
        if doubleImage {
            subImageView.snp.makeConstraints {
                $0.height.width.equalTo(36)
                $0.leading.equalToSuperview().inset(6)
                $0.bottom.equalToSuperview()
            }
            mainImageView.snp.makeConstraints {
                $0.height.width.equalTo(36)
                $0.leading.equalToSuperview()
                $0.top.equalToSuperview()
            }
        }
        else {
            mainImageView.snp.makeConstraints {
                $0.height.width.equalTo(40)
                $0.leading.equalToSuperview()
                $0.centerY.equalToSuperview()
            }
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(54)
            $0.top.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(54)
            $0.bottom.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.height.equalTo(31)
            $0.width.equalTo(52)
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }

}
