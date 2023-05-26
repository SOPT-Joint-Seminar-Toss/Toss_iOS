//
//  MainAssetResponse.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/26.
//

import Foundation

struct MainAssetResponse : Codable {
    let status : Int?
    let message : String?
    let data : [DataValue]
}

struct DataValue : Codable {
    let id : Int?
    let title : String?
    let balance : Int?
}

import Alamofire

class MainAssetManager {
    func getMainAsset(_ viewController : MainViewController) {
        let url = "http://15.164.215.92:8080/asset"
        let header: HTTPHeaders = ["Content-Type" : "application/json",
                                   "Authorization" : "1"]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: MainAssetResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("성공")
                dump(response)
//                print(response.response?.statusCode)
                viewController.getMainAssetResponse(response)
            case .failure(let error):
                print("실패")
                print(response.response?.statusCode)
                print(error.localizedDescription)
            }
        }
    }
    
}

