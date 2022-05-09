//
//  ViewController.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 7/5/22.
//

import UIKit
import Moya

class ViewController: UIViewController {

    var beers = [Beers]()
    var beersProvider = MoyaProvider<BeersService>()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        getBeers()
    }

    private func getBeers() {
        beersProvider.request(.getBeers(food: "Spicy")) { (result) in
            switch result {
            case .success(let response):
                let beers = try! JSONDecoder().decode([Beers].self, from: response.data)
                self.beers = beers
                print(beers)
            case .failure(let error):
                print(error)
            }
        }
    }
}

