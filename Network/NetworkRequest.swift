//
//  NetworkRequest.swift
//  Simple-
//
//  Created by Денис Александров on 08.12.2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getDate(completionHandeler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandeler(.failure(.urlError))
                } else {
                    guard let data else { return }
                    completionHandeler(.success(data))
                }
            }
        }
    }
}
