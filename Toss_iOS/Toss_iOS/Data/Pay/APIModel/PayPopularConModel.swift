//
//  PayPopularConModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

import UIKit

struct PopularConModel {
    var image: UIImage
    var name: String
    var price: String
    var cacheBack: String
}

extension PopularConModel {
    static func mockDummy() -> [PopularConModel] {
        return [
            PopularConModel(image: Image.coffee, name: "메가MGC커피 | (ICE)아메리카노", price: "2,000원", cacheBack: "60원 적립"),
            PopularConModel(image: Image.coffee, name: "메가MGC커피 | (ICE)아메리카노", price: "2,000원", cacheBack: "60원 적립"),
            PopularConModel(image: Image.coffee, name: "메가MGC커피 | (ICE)아메리카노", price: "2,000원", cacheBack: "60원 적립")
        ]
    }
}

struct PopularConRequest {
    var userId: String
}

// MARK: - PopulaConResponse
struct PopulaConResponse: Codable {
    let status: Int
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
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
