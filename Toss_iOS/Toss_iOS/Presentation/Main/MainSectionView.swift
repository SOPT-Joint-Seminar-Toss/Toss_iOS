//
//  MainSectionView.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/20.
//

import UIKit
import SnapKit
import Then

class MainSectionView: UIView {
    //MARK: - Properties
    var title: String

    //MARK: - UI Components
    private let contentView = UIView().then {
        $0.backgroundColor = .tossWhite
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = title
        $0.font = .spoqaHanSanNeo(.bold, size: 22)
        $0.textColor = UIColor(hex: 0x000000)
    }
    
    
    private let pushButton = UIButton().then {
        $0.setImage(Image.rightArrow, for: .normal)
    }
    //MARK: - Life Cycle
    init(title: String) {
        self.title = title
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
        
    }
    
    private func setLayout() {
        self.addSubview(contentView)
        contentView.addSubviews(titleLabel, pushButton)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(24)
        }
        pushButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().inset(24)
            $0.height.width.equalTo(24)
        }
        
    }
}
