//
//  GiftproductModel.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/26.
//

import Foundation

struct GiftproductModel: Codable {
    let id: Int
    let imageURL: String
    let brandTitle, productTitle: String
    let price, point, expiration: Int
    let productInfo: String
    let like: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case brandTitle, productTitle, price, point, expiration, productInfo, like
    }
}
