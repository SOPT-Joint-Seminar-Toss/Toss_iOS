////
////  PayProductCollectionFooterView.swift
////  Toss_iOS
////
////  Created by 류희재 on 2023/05/15.
////
//
//import UIKit
//
//import SnapKit
//import Then
//
//final class TvingContentHeaderView: UICollectionReusableView {
//    
//    //MARK: - Properties
//    
//    //MARK: - UI Components
//    
//    private let contentSectionTitleLabel = UILabel()
//    private lazy var fullButton = UIButton()
//    
//    //MARK: - Life Cycle
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        style()
//        hierarchy()
//        layout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //MARK: - Custom Method
//    
//    private func style() {
//        contentSectionTitleLabel.do {
//            $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
//            $0.textColor = .tvingWhite
//            $0.textAlignment = .center
//            $0.font = .tvingDisplay1
//        }
//        
//        fullButton.do {
//            $0.setTitle("전체보기", for: .normal)
//            $0.setImage(Image.next, for: .normal)
//            $0.setTitleColor(.tvingGray3, for: .normal)
//            $0.titleLabel?.font = .tvingSubTitle2
//            $0.imageView?.contentMode = .scaleAspectFit
//            $0.semanticContentAttribute = .forceRightToLeft //<- 중요
//        }
//    }
//    
//    private func hierarchy() {
//        self.addSubviews(contentSectionTitleLabel, fullButton)
//    }
//    
//    private func layout() {
//        contentSectionTitleLabel.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.leading.equalToSuperview()
//            $0.width.equalTo(168)
//            $0.height.equalTo(30)
//        }
//        
//        fullButton.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.trailing.equalToSuperview().inset(5)
//            $0.width.equalTo(54)
//            $0.height.equalTo(25)
//        }
//    }
//    
//    //MARK: - Action Method
//}
//
