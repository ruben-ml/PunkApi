//
//  Localizable+Strings.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
      }
}
