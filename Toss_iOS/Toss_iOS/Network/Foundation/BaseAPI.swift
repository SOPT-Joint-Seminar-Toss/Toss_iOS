//
//  BaseAPI.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/22.
//


import Foundation

import Alamofire


class BaseAPI{
    
    let AFManager: Session = {
        var session = AF
        let configuration = URLSessionConfiguration.af.default
        let eventLogger = AlamofireLogger()
        session = Session(configuration: configuration, eventMonitors: [eventLogger])
        return session
    }()
    
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<T>.self, from: data)
        else {
            return .pathErr
        }
        
//        guard let realData = try? decoder.decode(object.self, from: data) else {
//            print("✨✨✨✨")
//            print(decodedData)
//            return .decodedErr
//        }
        switch statusCode {
        case 200..<205:
            return .success(decodedData.data as Any)
        case 400..<500:
            return .requestErr("요청에러") //decodedData.status_message ??
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgeSimpleResponseStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SimpleResponse.self, from: data)
        else {
            return .pathErr
        }
        
        switch statusCode {
        case 200..<205:
            return .success(decodedData)
        case 406:
            return .authorizationFail((decodedData.message, decodedData.message))
        case 400..<500:
            return .requestErr(decodedData.message ?? "요청에러")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    public func disposeNetwork<T: Codable>(_ result: AFDataResponse<Data>, dataModel: T.Type, completion: @escaping (NetworkResult<Any>) -> Void){
        switch result.result {
        case .success:
            guard let statusCode = result.response?.statusCode else { return }
            guard let data = result.data else { return }
            
            if dataModel != VoidResult.self{
                print(data)
                let networkResult = self.judgeStatus(by: statusCode, data, dataModel.self)
                completion(networkResult)
            } else {
                let networkResult = self.judgeSimpleResponseStatus(by: statusCode, data)
                print("🦈🦈🦈🦈🦈🦈")
                completion(networkResult)
            }
        case .failure(let error):
            print("여기서 에러나는 경우는 무슨경우?")
            print(error)
        }
    }
}


