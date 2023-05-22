//
//  GenericResponse.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/22.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var code: Int?
    var message: String?
    var data: T?
}


