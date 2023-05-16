//
//  PayProductModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

struct Product {
    var image: UIImage
    var name: String
    var disCount: String
    var price: String
}

extension Product {
    static func mockDummy() -> [Product] {
        return [
            Product(image: Image.payMockImage, name: "나랑드사이다 제로 350ml 페트 1박스(20입)", disCount: "70%", price: "8,900원"),
            Product(image: Image.payMockImage, name: "나랑드사이다 제로 350ml 페트 1박스(20입)", disCount: "70%", price: "8,900원"),
            Product(image: Image.payMockImage, name: "나랑드사이다 제로 350ml 페트 1박스(20입)", disCount: "70%", price: "8,900원"),
            Product(image: Image.payMockImage, name: "나랑드사이다 제로 350ml 페트 1박스(20입)", disCount: "70%", price: "8,900원"),
            Product(image: Image.payMockImage, name: "나랑드사이다 제로 350ml 페트 1박스(20입)", disCount: "70%", price: "8,900원"),
            Product(image: Image.payMockImage, name: "나랑드사이다 제로 350ml 페트 1박스(20입)", disCount: "70%", price: "8,900원"),
            Product(image: Image.payMockImage, name: "나랑드사이다 제로 350ml 페트 1박스(20입)", disCount: "70%", price: "8,900원")
        ]
    }
}

