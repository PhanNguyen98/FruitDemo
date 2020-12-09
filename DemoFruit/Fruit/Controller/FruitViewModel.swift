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

class FruitViewModel {
    
    func checkPhotoLibrary(completionHanlder: @escaping ([Fruit]) -> Void) {
        var data = [Fruit]()
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ status in
                switch status {
                case .authorized:
                    data = FruitManager.shared.fruitData()
                    completionHanlder(data)
                default:
                    DispatchQueue.main.async {
                        UIApplication.shared.open(URL(string: "App-prefs:DemoFruit&path=Photo")!, options: [:], completionHandler: nil)
                    }
                }
            })
        } else if photos == .authorized {
            data = FruitManager.shared.fruitData()
            completionHanlder(data)
        }
    }
}
