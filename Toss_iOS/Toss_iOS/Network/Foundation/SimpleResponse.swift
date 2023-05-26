//
//  SimpleResponse.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/22.
//

import Foundation

struct SimpleResponse: Codable {
    var status: Int
    var data: Bool
    var message: String?
}

