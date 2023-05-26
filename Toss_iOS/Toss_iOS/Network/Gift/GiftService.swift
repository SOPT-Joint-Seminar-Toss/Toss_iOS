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
    case getProduct
}

extension GiftService: BaseTargetType {
    var parameters: RequestParams {
        switch self{
        case .patchHeart:
            return .none
        case .getProduct:
            return .none
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .patchHeart:
            return .patch
        case .getProduct:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .patchHeart:
            return "product/brand/1"
        case .getProduct:
            return "product/brand/1"
        }
    }
}

