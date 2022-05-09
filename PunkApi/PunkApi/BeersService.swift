//
//  BeersService.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import Foundation
import Moya

enum BeersService {
    case getBeers(food: String)
}

extension BeersService: TargetType {
  
    var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2")!
    }
    
    var path: String {
        switch self {
        case .getBeers:
            return "/beers"
        }
    }
    
    var method: Moya.Method { .get }
    
    var sampleData: Data { Data() }
    
    var task: Task {
        switch self {
        case .getBeers(let food):
            return .requestParameters(parameters: ["food": food], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
