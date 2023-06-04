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
    
    //MARK: - UI Components
    
    let placeHolder = "고마운 마음을 담아\n선물을 보내요"
    
    //상단 고정 영역
    private var topNavBar = UIView()
    private var backButton = UIButton()
    
    //카드 선택 영역
    private var cardLabel = UILabel()
    private var cardSelectView = UIView()
    private var ballonButton = UIButton()
    private var turtleButton = UIButton()
    private var ghostButton = UIButton()
    private var spaceshipButton = UIButton()
    private var ballonLabel = UILabel()
    private var turtleLabel = UILabel()
    private var ghostLabel = UILabel()
    private var spaceshipLabel = UILabel()
    
    //카드 작성 영역
    private var balloncardView = UIImageView()
    private var balloncardTextView = UITextView()
    private var editMessageButton = UIButton()
    private var editCompleteButton = UIButton()
    private var writeContentLabel = UILabel()
    private var cardEditState = false
    private var deleteButton = UIButton()
    
    //하단 고정 영역
    private var completeButton = UIButton(type: .custom)
    var indicator = UIActivityIndicatorView().then {
        $0.backgroundColor = UIColor(hex: 0xD478C5)
        $0.layer.cornerRadius = 14
    }
    
    
    // inputAccessoryView
    private var textViewAccessoryView = UIView()
    private var textViewEditMessageButton = UIButton()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addContentView()
        setStyle()
        setLayout()
        balloncardTextView.delegate = self
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    //MARK: - AddContent
    
    func addContentView() {
        view.addSubviews(topNavBar,
                         cardSelectView,
                         balloncardView,
                         editCompleteButton,
                         completeButton,
                         indicator)
        
        topNavBar.addSubview(backButton)
        
        cardSelectView.addSubviews(cardLabel,
                                   ballonButton,
                                   turtleButton,
                                   ghostButton,
                                   spaceshipButton,
                                   ballonLabel,
                                   turtleLabel,
                                   ghostLabel,
                                   spaceshipLabel)
        
        balloncardView.addSubviews(balloncardTextView,
                                   editMessageButton,
                                   writeContentLabel,
                                   deleteButton)
        
        textViewAccessoryView.addSubview(textViewEditMessageButton)
        
    }
    
    //MARK: - Style
    
    func setStyle() {
        view.backgroundColor = .tossWhite
        
        topNavBar.do {
            $0.backgroundColor = .tossWhite
            
            backButton.do {
                $0.setImage(Image.backArrow, for: .normal)
                $0.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
            }
        }
        
        cardSelectView.do {
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
            $0.contentMode = .scaleAspectFill //비율 설정!
            
            balloncardTextView.do {
                $0.isScrollEnabled = false
                $0.text = "고마운 마음을 담아\n선물을 보내요"
                $0.font = .tossHeader2
                $0.textColor = .init(hex: 0xC05FD0)
                $0.textAlignment = .center
                $0.backgroundColor = UIColor.clear
                $0.isEditable = true
                $0.textContainerInset = UIEdgeInsets(top: 20, left: 18, bottom: 18, right: 18)
                $0.inputAccessoryView = textViewAccessoryView
            }
            editMessageButton.do {
                $0.setTitle("메시지 수정", for: .normal)
                $0.titleLabel?.font = .tossBody3
                $0.backgroundColor = UIColor.init(hex: 0x8D94A0).withAlphaComponent(0.15)
                $0.makeCornerRound(radius: 19)
                $0.setImage(Image.edit, for: .normal)
                $0.setTitleColor(.tossGrey500, for: .normal)
                $0.imageView?.contentMode = .scaleAspectFit
                $0.contentHorizontalAlignment = .center
                $0.semanticContentAttribute = .forceLeftToRight
                $0.addTarget(self, action: #selector(editMessageButtonTap), for: .touchUpInside)
            }
            editCompleteButton.do {
                $0.setTitle("수정 완료", for: .normal)
                $0.titleLabel?.font = .tossBody2
                $0.setTitleColor(.tossWhite, for: .normal)
                $0.makeCornerRound(radius: 20)
                $0.backgroundColor = .tossBlue
                $0.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
            }
            writeContentLabel.do {
                $0.isHidden = true
                $0.textColor = .tossGrey400
                $0.font = .tossBody3
            }
            deleteButton.do {
                $0.isHidden = true
                $0.setImage(Image.delete, for: .normal)
                $0.addTarget(self, action: #selector(clean), for: .touchUpInside)
            }
        }
        
        textViewAccessoryView.do {
            $0.frame = .init(x: 0, y: 0, width: 400, height: 67)
            $0.backgroundColor = .clear
            
            
            textViewEditMessageButton.do {
                $0.setTitle("수정 완료", for: .normal)
                $0.titleLabel?.font = .tossBody2
                $0.setTitleColor(.tossWhite, for: .normal)
                $0.makeCornerRound(radius: 20)
                $0.backgroundColor = .tossBlue
                $0.addTarget(self,
                             action: #selector(completeButtonTap),
                             for: .touchUpInside)
            }
        }
        
        completeButton.do {
            $0.setTitle("완료", for: .normal)
            $0.titleLabel?.font = .spoqaHanSanNeo(.bold, size: 18)
            $0.setTitleColor(.tossWhite, for: .normal)
            $0.backgroundColor = UIColor(hex: 0xD478C5)
            $0.layer.cornerRadius = 14
            $0.addTarget(self, action: #selector(completeButtonTap), for: .touchUpInside)
        }
        
    }
    
    // MARK: - Layout
    
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
        
        cardSelectView.snp.makeConstraints {
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
            $0.top.equalTo(cardSelectView.snp.bottom).offset(21)
            $0.bottom.equalTo(completeButton.snp.top).offset(-30)
            $0.leading.trailing.equalToSuperview().inset(22)
            
            balloncardTextView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(26)
                $0.leading.trailing.equalToSuperview().inset(31)
                $0.height.greaterThanOrEqualTo(100)
            }
            editMessageButton.snp.makeConstraints {
                $0.top.equalTo(balloncardTextView.snp.bottom).offset(12)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(117)
                $0.height.equalTo(38)
            }
            writeContentLabel.snp.makeConstraints {
                $0.top.equalTo(balloncardTextView.snp.bottom).offset(20)
                $0.centerX.equalToSuperview()
            }
            deleteButton.snp.makeConstraints {
                $0.leading.equalTo(writeContentLabel.snp.trailing)
                $0.centerY.equalTo(writeContentLabel.snp.centerY)
            }
        }
        
        textViewEditMessageButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(132)
            $0.height.equalTo(40)
        }
        
        editCompleteButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(132)
            $0.height.equalTo(40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(54)
        }
        indicator.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(54)
        }
    }
}

// MARK: - Actions

extension GiftcardViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        balloncardTextView.resignFirstResponder()
        if(balloncardTextView.text == placeHolder){
            writeContentLabel.isHidden = true
            deleteButton.isHidden = true
        }
    }
    
    @objc
    private func editMessageButtonTap() {
        if(balloncardTextView.text == "고마운 마음을 담아\n선물을 보내요") {
            balloncardTextView.text = ""
        }
        balloncardTextView.becomeFirstResponder()
        editMessageButton.isHidden = true
    }
    
    @objc
    private func completeButtonTap() {
        let text = balloncardTextView.text
        print("수정 완료 버튼이 눌렸습니다.")
        balloncardTextView.resignFirstResponder()
        completeButton.isHidden = false
        writeContentLabel.isHidden = true
        deleteButton.isHidden = true
        editMessageButton.isHidden = false
    }
    
    @objc
    private func clean() {
        balloncardTextView.text = ""
        writeContentLabel.text = "0자/86자"
        writeContentLabel.isHidden = true
        deleteButton.isHidden = true
        
    }
    
    @objc
    func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func completeButtonTapped() {
        indicator.startAnimating()
        
        // MARK: - GIftViewDataSource
        
        GiftManager().postGift(self, productID: 1) { statusCode in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 , execute: {
                self.indicator.stopAnimating()
                let toastMessageViewController = ToastMessageViewController()
                toastMessageViewController.modalPresentationStyle = .overFullScreen
                switch statusCode {
                case 200:
                    print("성공")
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
                        self.present(toastMessageViewController, animated: false)
                    }) { (completed) in
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                                toastMessageViewController.dismiss(animated: false)
                                self.navigationController?.popViewController(animated: true)
                            }
                        })
                    }
                case 400:
                    print("유효하지 않은 입력")
                case 404:
                    print("존재하지 않는 상품")
                case 500:
                    print("서버 오류")
                default:
                    print(statusCode, "????/")
                }
            })
        }
    }
}

// MARK: - UITextViewDelegate

extension GiftcardViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        
        if placeHolder == textView.text {
            balloncardTextView.text = ""
        }
        
        completeButton.isHidden = true
        editMessageButton.isHidden = true
        writeContentLabel.isHidden = false
        deleteButton.isHidden = false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        deleteButton.isHidden = false
        writeContentLabel.isHidden = false
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        editMessageButton.isHidden = textView.hasText
        if !textView.hasText {
            textView.text = placeHolder
        }
        if(!editMessageButton.isHidden){
            writeContentLabel.isHidden = true
            deleteButton.isHidden = true
        }
        else {
            writeContentLabel.isHidden = false
            deleteButton.isHidden = false
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else  { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        writeContentLabel.text = "\(changedText.count)자/86자"
        
        if(changedText.count <= 85) {
            if(changedText.count > 21) {
                balloncardTextView.font = .tossTitle2
                balloncardTextView.textContainerInset = UIEdgeInsets(top: 20, left: 18, bottom: 18, right: 18)
            }
            else {
                balloncardTextView.font = .tossHeader2
                balloncardTextView.textContainerInset = UIEdgeInsets(top: 20, left: 18, bottom: 18, right: 18)
            }
        }
        else {
            return false
        }
        
        return true
    }
}
