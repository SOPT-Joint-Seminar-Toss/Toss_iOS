//
//  GiftService.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/26.
//

import Foundation

import Alamofire

enum GiftService{
    case patchHeart
}

extension GiftService: BaseTargetType {
    var parameters: RequestParams {
        switch self{
        case .patchHeart:
            return .none
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .patchHeart:
            return .patch
        }
    }
    
    var path: String {
        switch self {
        case .patchHeart:
            return "product/brand/1"
        }
    }
}

