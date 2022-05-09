//
//  BeersTVCell.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import Foundation
import UIKit

class BeersTVCell: UITableViewCell, Reusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
