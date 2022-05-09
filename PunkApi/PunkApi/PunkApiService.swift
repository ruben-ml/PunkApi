//
//  PunkApiService.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import Foundation
import Moya

enum PunkApiService {
    case getBeers
}

extension PunkApiService: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2")!
    }
    
    var path: String {
        switch self {
        case .getBeers:
            return "/beers"
        }
    }
    
    var method: Moya.Method { .post }
    
    var sampleData: Data {
        switch self {
        case.getBeers:
            return Data()
        }
    }
    
    private var parameters: [String: Any] {
        var parameters = [String: Any]()
        switch self {
        case .getBeers:
            parameters["food"] = "Spicy"
            
        }
        return parameters
    }
    
    var task: Task {
        switch self {
        case .getBeers:
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
