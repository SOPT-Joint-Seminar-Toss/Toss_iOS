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
    private var ballonLabel = UILabel()
    private var turtleLabel = UILabel()
    private var ghostLabel = UILabel()
    private var spaceshipLabel = UILabel()
    
    //카드 작성 영역
    //private var cardeditView = UIView()
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
        cardselectView.addSubviews(cardLabel, ballonButton, turtleButton, ghostButton, spaceshipButton, ballonLabel, turtleLabel, ghostLabel, spaceshipLabel)
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
            }
            ballonLabel.do {
                $0.text = "풍선"
                $0.font = .tossBody3
                $0.textColor = .tossGrey400
            }
            turtleButton.do {
                $0.setImage(Image.turtle, for: .normal)
            }
            turtleLabel.do {
                $0.text = "거북이"
                $0.font = .tossBody3
                $0.textColor = UIColor.init(hex: 0xB9BCC2)
            }
            ghostButton.do {
                $0.setImage(Image.ghost, for: .normal)
            }
            ghostLabel.do {
                $0.text = "유령"
                $0.font = .tossBody3
                $0.textColor = UIColor.init(hex: 0xB9BCC2)
            }
            spaceshipButton.do {
                $0.setImage(Image.spaceShip, for: .normal)
            }
            spaceshipLabel.do {
                $0.text = "우주선"
                $0.font = .tossBody3
                $0.textColor = UIColor.init(hex: 0xB9BCC2)
            }
        }
        
        
        balloncardView.do {
            $0.image = Image.giftCard
            $0.isUserInteractionEnabled = true
            $0.contentMode = .scaleAspectFill
            
            balloncardTextView.do {
                $0.isScrollEnabled = false
                $0.text = "고마운 마음을 담아\n선물을 보내요"
                $0.font = .tossHeader2
                $0.textColor = .init(hex: 0xC05FD0)
                $0.textAlignment = .center
                $0.backgroundColor = UIColor.clear
                $0.isEditable = true
                $0.textContainerInset = UIEdgeInsets(top: 20, left: 18, bottom: 18, right: 18)
            }
            messageEditButton.do {
                $0.setTitle("메시지 수정", for: .normal)
                $0.titleLabel?.font = .tossBody3
                $0.backgroundColor = UIColor.init(hex: 0x8D94A0).withAlphaComponent(0.15)
                $0.makeCornerRound(radius: 19)
                $0.setImage(Image.edit, for: .normal)
                $0.setTitleColor(.tossGrey500, for: .normal)
                $0.imageView?.contentMode = .scaleAspectFit
                $0.contentHorizontalAlignment = .center
                $0.semanticContentAttribute = .forceLeftToRight
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
                $0.height.equalTo(22)
                $0.centerX.equalToSuperview()
            }
            ballonButton.snp.makeConstraints {
                $0.top.equalTo(cardLabel.snp.bottom).offset(20)
                $0.leading.equalToSuperview()
                $0.size.equalTo(60)
            }
            ballonLabel.snp.makeConstraints {
                $0.top.equalTo(ballonButton.snp.bottom).offset(10)
                $0.centerX.equalTo(ballonButton.snp.centerX)
            }
            turtleButton.snp.makeConstraints {
                $0.top.equalTo(ballonButton.snp.top)
                $0.leading.equalTo(ballonButton.snp.trailing).offset(17)
                $0.size.equalTo(60)
            }
            turtleLabel.snp.makeConstraints {
                $0.top.equalTo(turtleButton.snp.bottom).offset(10)
                $0.centerX.equalTo(turtleButton.snp.centerX)
            }
            ghostButton.snp.makeConstraints {
                $0.top.equalTo(ballonButton.snp.top)
                $0.trailing.equalTo(spaceshipButton.snp.leading).offset(-17)
                $0.size.equalTo(60)
            }
            ghostLabel.snp.makeConstraints {
                $0.top.equalTo(ghostButton.snp.bottom).offset(10)
                $0.centerX.equalTo(ghostButton.snp.centerX)
            }
            spaceshipButton.snp.makeConstraints {
                $0.top.equalTo(ballonButton.snp.top)
                $0.trailing.equalToSuperview()
                $0.size.equalTo(60)
            }
            spaceshipLabel.snp.makeConstraints {
                $0.top.equalTo(spaceshipButton.snp.bottom).offset(10)
                $0.centerX.equalTo(spaceshipButton.snp.centerX)
            }
        }
        
        balloncardView.snp.makeConstraints {
            $0.top.equalTo(cardselectView.snp.bottom).offset(21)
            $0.bottom.equalTo(completeButton.snp.top).offset(-30)
            $0.leading.trailing.equalToSuperview().inset(22)
            
            balloncardTextView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(26)
                $0.leading.trailing.equalToSuperview().inset(31)
                $0.height.greaterThanOrEqualTo(100)
            }
            messageEditButton.snp.makeConstraints {
                $0.top.equalTo(balloncardTextView.snp.bottom).offset(12)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(117)
                $0.height.equalTo(38)
            }
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(54)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            balloncardTextView.endEditing(true)
        }
    
}

//extension GiftcardViewController: UITextViewDelegate {
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        <#code#>
//    }
//
//    func textViewDidChange(_ textView: UITextView) {
//        <#code#>
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        <#code#>
//    }
//}
