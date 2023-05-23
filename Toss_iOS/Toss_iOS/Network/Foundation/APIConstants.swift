//
//  APIConstants.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/22.
//

import Foundation

struct APIConstants{
    
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
    static let auth = "Authorization"
    static let userId = "1"
}

extension APIConstants{
    
    static var noTokenHeader: Dictionary<String,String> {
        [contentType: applicationJSON]
    }
    
    static var hasTokenHeader: Dictionary<String,String> {
        [auth : userId]
    }
}

