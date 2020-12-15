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
}
