//
//  NetworkManager.swift
//  EnumRequests
//
//  Created by Tiago Chaves on 22/08/20.
//  Copyright © 2020 105 Developers. All rights reserved.
//

import Foundation
import Alamofire

enum EnumRequests: URLRequestConvertible {
    static let baseUrl = "https://dummyapi.io"
    
    case userList
    case user(userId:String)
    
    var method: HTTPMethod {
        switch self {
        case .userList, .user:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .userList:
            return "/data/api/user"
        case .user(let userId):
            return "/data/api/user/\(userId)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try EnumRequests.baseUrl.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.headers.add(name: "app-id", value: API_KEY)
        
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: nil)
    }
}

final class NetworkManager {
    static func request(_ request: EnumRequests,
                        completion: @escaping ((Data?, Error?) -> Void)) {
        AF.request(request).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                let data = response.data
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
