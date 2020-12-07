//
//  UIViewController+FormatValue.swift
//  DemoFruit
//
//  Created by Phan Nguyen on 07/12/2020.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func roundingValue(_ value: Double) -> String {
        return String(format: "%.1f", value)
    }
}
