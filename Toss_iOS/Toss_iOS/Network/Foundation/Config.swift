//
//  Config.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/22.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let api = "MOVIE_API"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
    
    static let api: String = {
        guard let key = Config.infoDictionary[Keys.Plist.api] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
}


