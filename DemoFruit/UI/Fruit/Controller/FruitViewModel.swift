//
//  FruitViewModel.swift
//  DemoFruit
//
//  Created by Phan Nguyen on 08/12/2020.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import Foundation
import Photos
import UIKit

protocol FruitViewModelDelegate: class {
    func reloadData()
}

class FruitViewModel {
    weak var delegate: FruitViewModelDelegate?
    
    var dataSource = [Fruit]()
    
    func checkPhotoLibrary() {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ status in
                switch status {
                case .authorized:
                    self.dataSource = FruitManager.shared.fruitData()
                    self.delegate?.reloadData()
                default:
                    DispatchQueue.main.async {
                        UIApplication.shared.open(URL(string: "App-prefs:DemoFruit&path=Photo")!, options: [:], completionHandler: nil)
                    }
                }
            })
        } else if photos == .authorized {
            dataSource = FruitManager.shared.fruitData()
            self.delegate?.reloadData()
        }
    }
    
    func loadNewDataSources() {
        guard let listData: [DataFruit] = UserDefaultManager.shared.getInfor() as? [DataFruit] else { return }
        for item in listData {
            for index in 0..<dataSource.count{
                if item.ID == dataSource[index].ID {
                    dataSource[index].priceFruit = item.price
                    dataSource[index].ratingFruit = item.rating
                    dataSource[index].amountFruit = item.amount
                }
            }
        }
        self.delegate?.reloadData()
    }
    
}
