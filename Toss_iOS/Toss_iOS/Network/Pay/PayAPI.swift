//
//  PayAPI.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/22.
//

import Foundation

import Alamofire

class PayAPI: BaseAPI {
    static let shared = PayAPI()

    private override init() {}
}

extension PayAPI{
    
    public func getPopularCon(completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(PayService.getUserInfo).responseData { response in
            self.disposeNetwork(response,
                                dataModel: PopulaConResponse.self,
                                completion: completion)
        }
    }
}


