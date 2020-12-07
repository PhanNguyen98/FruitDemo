//
//  UIButton+RoundButton.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/27/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

extension UIButton {
    
    func roundedButtonLeft(width: Int, height: Int){
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topLeft , .bottomLeft],
                                    cornerRadii: CGSize(width: width, height: height))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedButtonRight(width: Int, height: Int){
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topRight , .bottomRight],
                                    cornerRadii: CGSize(width: width, height: height))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
}
