//
//  GiftcardViewController.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/22.
//

import UIKit

import SnapKit
import Then

class GiftcardViewController: UIViewController {
    
    //상단 고정 영역
    private var topNavBar = UIView()
    private var backButton = UIButton()
    
    //카드 선택 영역
    private var cardLabel = UILabel()
    private var cardselectView = UIView()
    private var ballonButton = UIButton()
    private var turtleButton = UIButton()
    private var ghostButton = UIButton()
    private var spaceshipButton = UIButton()
    
    //카드 작성 영역
    //private var cardeditView = UIView()
    let placeholder = "고마운 마음을 담아\n선물을 보내요"
    private var balloncardView = UIImageView()
    private var balloncardTextView = UITextView()
    private var messageEditButton = UIButton()
    
    //하단 고정 영역
    private var completeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addContentView()
        setStyle()
        setLayout()
    }
    
    func addContentView() {
        view.addSubviews(topNavBar, cardselectView, balloncardView, completeButton)
        topNavBar.addSubview(backButton)
        cardselectView.addSubviews(cardLabel, ballonButton, turtleButton, ghostButton, spaceshipButton)
        balloncardView.addSubviews(balloncardTextView, messageEditButton)
    }
    
    func setStyle() {
        view.backgroundColor = .tossWhite
        
        topNavBar.do {
            $0.backgroundColor = .tossWhite
            
            backButton.do {
                $0.setImage(Image.backArrow, for: .normal)
            }
        }
        
        cardselectView.do {
            $0.backgroundColor = .tossWhite
            
            cardLabel.do {
                $0.text = "카드를 골라주세요"
                $0.textColor = .tossGrey500
                $0.font = .tossTitle1
            }
            ballonButton.do {
                $0.setImage(Image.balloon, for: .normal)
                $0.setTitle("풍선", for: .normal)
                $0.setTitleColor(.tossGrey100, for: .normal)
                $0.setTitleColor(.tossGrey400, for: .selected)
                $0.titleLabel?.font = .tossBody3
            }
            turtleButton.do {
                $0.setImage(Image.turtle, for: .normal)
                $0.setTitle("거북이", for: .normal)
                $0.setTitleColor(.tossGrey100, for: .normal)
                $0.setTitleColor(.tossGrey400, for: .selected)
                $0.titleLabel?.font = .tossBody3
            }
            ghostButton.do {
                $0.setImage(Image.ghost, for: .normal)
                $0.setTitle("유령", for: .normal)
                $0.setTitleColor(.tossGrey100, for: .normal)
                $0.setTitleColor(.tossGrey400, for: .selected)
                $0.titleLabel?.font = .tossBody3
            }
            spaceshipButton.do {
                $0.setImage(Image.spaceShip, for: .normal)
                $0.setTitle("우주선", for: .normal)
                $0.setTitleColor(.tossGrey100, for: .normal)
                $0.setTitleColor(.tossGrey400, for: .selected)
                $0.titleLabel?.font = .tossBody3
            }
        }
        
        
        balloncardView.do {
            $0.image = Image.giftCard
            
            balloncardTextView.do {
                $0.font = .tossHeader2
                $0.textColor = .init(hex: 0xC05FD0)
                $0.textAlignment = .center
                $0.backgroundColor = UIColor.clear
                $0.isEditable = true
                $0.textContainerInset = UIEdgeInsets(top: 50, left: 18, bottom: 18, right: 18)
            }
            messageEditButton.do {
                $0.setImage(Image.messageEdit, for: .normal)
            }
        }
        
        
        completeButton.do {
            $0.setImage(Image.complete, for: .normal)
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
        }
        
        cardselectView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(97)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(127)
            $0.width.equalTo(291)
            
            cardLabel.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.width.equalTo(150)
                $0.height.equalTo(22)
                $0.centerX.equalToSuperview()
            }
            ballonButton.snp.makeConstraints {
                $0.top.equalTo(cardLabel.snp.bottom).offset(20)
                $0.leading.equalToSuperview()
                $0.size.equalTo(60)
            }
            turtleButton.snp.makeConstraints {
                $0.top.equalTo(ballonButton.snp.top)
                $0.leading.equalTo(ballonButton.snp.trailing).offset(17)
                $0.size.equalTo(60)
            }
            ghostButton.snp.makeConstraints {
                $0.top.equalTo(ballonButton.snp.top)
                $0.trailing.equalTo(spaceshipButton.snp.leading).offset(-17)
                $0.size.equalTo(60)
            }
            spaceshipButton.snp.makeConstraints {
                $0.top.equalTo(ballonButton.snp.top)
                $0.trailing.equalToSuperview()
                $0.size.equalTo(60)
            }
        }
        
        balloncardView.snp.makeConstraints {
            $0.top.equalTo(cardselectView.snp.bottom).offset(21)
            $0.bottom.equalTo(completeButton.snp.top).offset(30)
            $0.centerX.equalToSuperview()
            
            balloncardTextView.snp.makeConstraints {
                $0.width.equalTo(265)
                $0.height.equalTo(104)
                $0.top.equalTo(balloncardView.snp.top).offset(26)
                $0.centerX.equalToSuperview()
            }
            messageEditButton.snp.makeConstraints {
                $0.top.equalTo(balloncardTextView.snp.bottom).inset(12)
                $0.centerX.equalToSuperview()
            }
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(54)
        }
    }
    
    func setupTextView() {
        balloncardTextView.delegate = self
        balloncardTextView.text = placeholder /// 초반 placeholder 생성
        balloncardTextView.textColor = UIColor(hex: 0xC05FD0) /// 초반 placeholder 색상 설정
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            balloncardTextView.endEditing(true)
        }
    
}

extension GiftcardViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        <#code#>
    }
    
    func textViewDidChange(_ textView: UITextView) {
        <#code#>
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        <#code#>
    }
}