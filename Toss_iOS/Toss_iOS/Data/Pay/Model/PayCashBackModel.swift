//
//  PayCashBackModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

struct CashBack {
    var image: UIImage
    var title: String
    var describe: String
}

extension CashBack {
    static func mockDummy() -> [CashBack] {
        return [
            CashBack(image: Image.cashBack, title: "캐시백 받을 브랜드 고르기", describe: "3개 선택 가능"),
            CashBack(image: Image.yogiyo, title: "1,000원",
                     describe: "요기요 · 23일 남음"),
            CashBack(image: Image.samsung, title: "10,000원",
                     describe: "삼성화재 다이렉트 (자동차보험) · 145일 남음"),
        ]
    }
}

