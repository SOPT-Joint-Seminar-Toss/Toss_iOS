//
//  PayBrandConModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/16.
//

import UIKit

struct BrandCon {
    var image: UIImage
    var name: String
}

extension BrandCon {
    static func mockDummy() -> [BrandCon] {
        return [
            BrandCon(image: Image.cafe, name: "카페"),
            BrandCon(image: Image.coupon, name: "상품권"),
            BrandCon(image: Image.chicken, name: "치킨"),
            BrandCon(image: Image.pizza, name: "피자·버거"),
            BrandCon(image: Image.conv, name: "편의점"),
            BrandCon(image: Image.food, name: "외식"),
            BrandCon(image: Image.dessert, name: "디저트"),
        ]
    }
}
