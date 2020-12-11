//
//  UIView+DropShadow.swift
//  DemoFruit
//
//  Created by Phan Nguyen on 10/12/2020.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

extension UIView {

    func dropShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat, scale: Bool) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
    
}
