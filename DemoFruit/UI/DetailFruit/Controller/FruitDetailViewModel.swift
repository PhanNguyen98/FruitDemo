//
//  FruitDetailViewModel.swift
//  DemoFruit
//
//  Created by Phan Nguyen on 09/12/2020.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit
import Cosmos

protocol FruitDetailViewModelDelegate: class {
    func increase(count: Int)
    func decrease(count: Int)
}

class FruitDetailViewModel {
    
    weak var delegate: FruitDetailViewModelDelegate?
    
    func increaseCount(count: Int){
        let number = count + 1
        delegate?.increase(count: number)
    }
    
    func decreaseCount(count: Int){
        var number = count - 1
        if number < 0 {
            number = 0
        }
        delegate?.decrease(count: number)
    }
    
}
