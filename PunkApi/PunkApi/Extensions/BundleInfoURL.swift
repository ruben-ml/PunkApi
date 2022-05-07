//
//  BundleInfoURL.swift
//  PunkApi 
//
//  Created by Rubén Muñoz López on 7/5/22.
//

import Foundation

@propertyWrapper
struct BundleInfoURL {
    let key: String
    private var bundle: Bundle = .main

    init(key: String) {
        self.key = key
    }

    var wrappedValue: URL {
        let string = (infoDictionary[key] as? String) ?? ""
        guard let url = URL(string: string) else {
            fatalError()
        }
        return url
    }

    private var infoDictionary: [String: Any] {
        bundle.infoDictionary ?? [:]
    }
}
