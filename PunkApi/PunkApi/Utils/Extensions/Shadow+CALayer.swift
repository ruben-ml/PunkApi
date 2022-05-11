//
//  Shadow+CALayer.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 10/5/22.
//

import UIKit

extension CALayer {
    func applySketchShadow(color: UIColor, alpha: Float = 1.0, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / UIScreen.main.scale
        masksToBounds = false
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
