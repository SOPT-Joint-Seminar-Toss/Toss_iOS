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
}

extension HomeService: BaseTargetType {
    var parameters: RequestParams {
        switch self{
        case .getPopularCon:
            return .none
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getPopularCon:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getPopularCon:
            return "product"
        }
    }
}

