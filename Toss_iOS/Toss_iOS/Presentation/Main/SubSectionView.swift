//
//  SubSectionView.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/20.
//

import UIKit
import SnapKit
import Then

class SubSectionView: UIView {
    //MARK: - Properties
    var title: String
    var subTitle : String
    var image: UIImage
    var imageHidden: Bool
    
    //MARK: - UI Components
    private let contentView = UIView().then {
        $0.backgroundColor = .tossWhite
    }
    private lazy var titleLabel = UILabel().then {
        $0.text = title
        $0.font = .spoqaHanSanNeo(.bold, size: 18)
        $0.textColor = .tossGrey600
        $0.numberOfLines = 2
        $0.textAlignment = .left
    }
    private lazy var subTitleLabel = UILabel().then {
        $0.text = subTitle
        $0.font = .spoqaHanSanNeo(.medium, size: 16)
        $0.textColor = .tossGrey300
    }
    private lazy var imageView = UIImageView().then {
        $0.image = image
    }
    
    init(title: String, subTitle: String, image: UIImage, imageHidden: Bool) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.imageHidden = imageHidden
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
        imageView.isHidden = imageHidden
    }
    
    private func setLayout() {
        self.addSubview(contentView)
        contentView.addSubviews(titleLabel, subTitleLabel, imageView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(157)
            $0.width.equalTo(127)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().inset(20)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(8)
        }
        imageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.width.equalTo(33)
        }
    }
}
