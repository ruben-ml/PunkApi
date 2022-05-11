//
//  BeersPresenter.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import Foundation
import Moya

class BeersPresenter {

    var view: BeersViewApi?
    
    func viewDidLoad() {
        view?.getBeers()
    }
    
    func didSelectCellAtIndexPath(indexPath: IndexPath) {
        view?.didPressCell(sender: indexPath)
    }
    
}

