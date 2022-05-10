//
//  BeersPresenter.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import Foundation
import Moya

class BeersPresenter {
    
    var beers = [Beers]()
    var beersProvider = MoyaProvider<BeersService>()
    
    func getBeers(completion: @escaping ([Beers])->()) {
        beersProvider.request(.getBeers(food: "Spicy")) { (result) in
            switch result {
            case .success(let response):
                let beers = try! JSONDecoder().decode([Beers].self, from: response.data)
                completion(beers)
                print(beers)
            case .failure(let error):
                print(error)
            }
        }
    }
}
