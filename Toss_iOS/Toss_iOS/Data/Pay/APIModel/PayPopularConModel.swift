//
//  PayPopularConModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/17.
//

struct PopularConRequest {
    let userId: String
}

// MARK: - PopulaConResponse
struct PopularConResponse: Codable {
    let id: Int
    let imageURL, brandTitle, productTitle: String
    let price, point: Int

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case brandTitle, productTitle, price, point
    }
}
