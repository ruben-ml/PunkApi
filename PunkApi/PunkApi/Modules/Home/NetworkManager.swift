//
//  NetworkManager.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 10/5/22.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<BeersService> { get }
    func getBeers(completion: @escaping ([Beers])->())
}

struct VerbosePlugin: PluginType {
    let verbose: Bool

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        #if DEBUG
        if let body = request.httpBody,
           let str = String(data: body, encoding: .utf8) {
            print("request to send: \(str))")
        }
        #endif
        return request
    }
}

struct NetworkManager: Networkable {
    
    var provider = MoyaProvider<BeersService>(plugins: [VerbosePlugin(verbose: true)])
    
    func getBeers(completion: @escaping ([Beers])->()) {
        provider.request(.getBeers(food: "Spicy")) { (result) in
            switch result {
            case .success(let response):
                do {
                    let beers = try JSONDecoder().decode([Beers].self, from: response.data)
                    completion(beers)
                    print(beers)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
