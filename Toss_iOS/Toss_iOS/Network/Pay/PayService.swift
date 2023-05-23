//
//  PayService.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/22.
//

import Foundation

import Alamofire

enum PayService{
    case getPopularCon
    case getProduct
}

extension PayService: BaseTargetType {
    var parameters: RequestParams {
        switch self{
        case .getPopularCon:
            return .none
        case .getProduct:
            return .none
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getPopularCon:
            return .get
        case .getProduct:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getPopularCon:
            return "product/brand"
        case .getProduct:
            return "product"
        }
    }
}

