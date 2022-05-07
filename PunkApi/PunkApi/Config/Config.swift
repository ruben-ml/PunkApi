//
//  Config.swift
//  PunkApi 
//
//  Created by Rubén Muñoz López on 7/5/22.
//

import Foundation

@objc class Config: NSObject {
    // MARK: - Api Base URL
    @BundleInfoURL(key: "API_BASE_URL") static var apiBaseURL: URL
}
