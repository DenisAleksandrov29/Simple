//
//  NetworkDataFech.swift
//  Simple-
//
//  Created by Денис Александров on 08.12.2023.
//

import Foundation

class NetworkDataFech {
    
    static let shared = NetworkDataFech()
    
    private init() {}
    
    func fetchUsers(responce: @escaping ([User]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getDate { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    responce(users, nil)
                } catch let jsonError {
                    print("Failled to decode JSON", jsonError)
                }
            case .failure(_):
                responce(nil, .canNotParsedate)
            }
            
        }
    }
}


