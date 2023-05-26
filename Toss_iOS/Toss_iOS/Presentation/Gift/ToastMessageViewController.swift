//
//  ToastMessageViewController.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/26.
//

import UIKit

class ToastMessageViewController: UIViewController {
    
    private let toastMessageView = UIView().then {
        $0.backgroundColor = UIColor(hex: 0x191E28, alpha: 0.5)
        $0.layer.cornerRadius = 20
    }
    
    let checkImageView = UIImageView().then {
        $0.image = UIImage(systemName: "checkmark.circle.fill")
        $0.tintColor = UIColor(hex: 0x14BF79)
    }
    
    let toastMesssageLabel = UILabel().then {
        $0.text = "카드가 저장되었습니다"
        $0.textColor = UIColor(hex: 0xFFFFFF)
        $0.font = .spoqaHanSanNeo(.medium, size: 16)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponents()
        setupLayout()
        setupConstraints()
    }
    
    func setComponents() {
        view.backgroundColor = .clear
    }

    func setupLayout() {
        view.addSubview(toastMessageView)
        toastMessageView.addSubviews(toastMesssageLabel, checkImageView)
    }
    
    func setupConstraints() {
        toastMessageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-105)
            $0.height.equalTo(40)
        }
        checkImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(18)
            $0.centerY.equalToSuperview()
        }
        toastMesssageLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(checkImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
