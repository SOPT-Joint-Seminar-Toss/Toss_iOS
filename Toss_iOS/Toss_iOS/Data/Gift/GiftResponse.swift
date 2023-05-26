//
//  GiftResponse.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/26.
//

import Foundation


struct GiftResponse : Codable {
    let status : Int?
    let message : String
}

import Alamofire

class GiftManager {
    func postGift(_ viewController : GiftcardViewController, productID : Int, completionHandler : @escaping (Int) -> Void) {
        let url = "http://15.164.215.92:8080/product/brand/present/\(productID)"
        let header: HTTPHeaders = ["Content-Type" : "application/json",
                                   "Authorization" : "1"]
        let params = ["cardType" : "BALLOON",
                      "content" : "\(productID)"]
        AF.request(url,
                   method: .post,
        parameters: params,
                   encoder: JSONParameterEncoder(),
        headers: header)
        .validate()
        .responseDecodable(of: GiftResponse.self) { response in
            switch response.result {
            case .success(let result):
                completionHandler(response.response?.statusCode ?? 0)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
