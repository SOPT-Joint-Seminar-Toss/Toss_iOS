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
    private var infoButton = UIButton()
    private var reviewButton = UIButton()
    
    private var itemEtcView = UIView()
    private var expirydateLabel = UILabel()
    private var noticeButton = UIButton()
    private var brandconButton = UIButton()
    
    //상단 고정영역
    //하단 고정영역
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addContentView() //먼저 안하면 에러남 어이없음
        setStyle()
        setLayout()
        //setConfiguration()
            
    }
    
    //MARK: - Custom Method
    func addContentView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(itemMainView, itemInfoView, itemEtcView)
        itemInfoView.addSubviews(infoButton, reviewButton)
        itemEtcView.addSubviews(expirydateLabel, noticeButton, brandconButton)
    }
    
    func setStyle() {
        view.backgroundColor = .tossWhite
        
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
                $0.setTitleColor(UIColor(hex: 0x191919), for: .normal)
                $0.titleLabel?.textAlignment = .center
            }
            reviewButton.do {
                $0.backgroundColor = .tossWhite
                $0.setTitle("후기", for: .normal)
                $0.setTitleColor(UIColor(hex: 0x191919), for: .normal)
                $0.titleLabel?.font = .tossTitle2
                $0.titleLabel?.textAlignment = .center
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
    }
    
    func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        itemMainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(86)
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
        
    }
    
//    func setConfiguration() {
//
//    }

}
