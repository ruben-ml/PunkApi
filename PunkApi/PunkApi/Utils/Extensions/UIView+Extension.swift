//
//  UIView+Extension.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
