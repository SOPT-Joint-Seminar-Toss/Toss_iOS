//
//  PayPopularBrandModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

struct Brand {
    var rank: String
    var image: UIImage
    var name: String
}

extension Brand {
    static func mockDummy() -> [Brand] {
        return [
            Brand(rank: "1", image: Image.baemin, name: "배달의 민족"),
            Brand(rank: "2", image: Image.musins, name: "무신사"),
            Brand(rank: "3", image: Image.nexon, name: "넥슨"),
            Brand(rank: "4", image: Image.yeogi, name: "여기어때"),
            Brand(rank: "5", image: Image.yogiyo, name: "요기요")
        ]
    }
}

