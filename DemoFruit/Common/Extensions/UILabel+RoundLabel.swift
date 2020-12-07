//
//  UILabel+RoundLabel.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/27/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

extension UILabel {
    
    func roundedLabelRight(width: Int, height: Int){
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topRight , .bottomRight],
                                    cornerRadii: CGSize(width: width, height: height))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
}
