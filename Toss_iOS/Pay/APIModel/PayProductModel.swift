//
//  PayProductModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/15.
//

import UIKit

struct Product {
    var profileImage: UIImage
    var count: String
}

extension Product {
    static func mockDummy() -> [Product] {
        return [
            Product(profileImage: Image.profile, count: "9,546"),
            Product(profileImage: Image.profile2, count: "38,977"),
        ]
    }
}

struct ProductReqeust: Codable {
    let userId: String
}

struct ProductResponse: Codable {
    let id: Int
    let imageURL, title: String
    let discountRate, price: Int
    let endDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case title, discountRate, price, endDate
    }
}
