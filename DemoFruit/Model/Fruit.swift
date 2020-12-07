//
//  Fruit.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/24/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import Foundation
import UIKit

enum FruitType: String {
    case apple
    case banana
    case mango
    case pineapple
    case orange
    case watermelon
    case notType
}

class Fruit {
    var priceFruit: Int?
    var imageFruit: UIImage?
    var nameFruit: FruitType
    init(price: Int, image: UIImage, name: String){
        self.imageFruit = image
        self.priceFruit = price
        self.nameFruit = FruitType(rawValue: name) ?? FruitType.notType
    }
}
