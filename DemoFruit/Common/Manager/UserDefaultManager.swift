//
//  UserDefaultManager.swift
//  DemoFruit
//
//  Created by Phan Nguyen on 23/12/2020.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import Foundation

class UserDefaultManager {
    static let shared = UserDefaultManager()
    let userManager = UserDefaults.standard
    
    var data = DataFruit()
    
    func setInfor(data: DataFruit) {
        var arrayFruit = [DataFruit]()
        arrayFruit = getInfor()
        arrayFruit.append(data)
        userManager.setStructArray(arrayFruit, forKey: "ArrayFruit")
    }
    
    func getInfor() -> [DataFruit] {
        guard let data: [DataFruit] = userManager.structArrayData(DataFruit.self, forKey: "ArrayFruit") as? [DataFruit] else {
            return [DataFruit]()
        }
        return data
    }
    
}
