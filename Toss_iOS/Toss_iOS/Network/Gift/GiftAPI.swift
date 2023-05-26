//
//  GiftAPI.swift
//  Toss_iOS
//
//  Created by 신지원 on 2023/05/26.
//

import Foundation

import Alamofire

class GiftAPI: BaseAPI {
    static let shared = GiftAPI()

    private override init() {}
}

extension GiftAPI{
    
    public func patchHeart(completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(GiftService.patchHeart).responseData { response in
            self.disposeNetwork(response,
                                dataModel: VoidResult.self,
                                completion: completion)
        }
    }
    public func getProduct(completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(GiftService.getProduct).responseData { response in
            self.disposeNetwork(response,
                                dataModel: GiftproductModel.self,
                                completion: completion)
        }
    }
}
