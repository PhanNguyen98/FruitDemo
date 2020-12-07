//
//  FruitManager.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/24/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import Foundation
import UIKit
import Photos


class FruitManager {
    static let shared = FruitManager()
    
    func fruitData() -> [Fruit] {
        var fruitArray = [Fruit]()
        let fruitAssetArray = getAllFruitAsset()
        if fruitAssetArray.count != 0 {
            for index in 0..<fruitAssetArray.count {
                let resources = PHAssetResource.assetResources(for: fruitAssetArray[index])
                let namePhoto = resources.first?.originalFilename
                let nameFruit  = namePhoto?.components(separatedBy: ".")
                let fruit = Fruit(price: index, image: PhotoManager.shared.getImageForAsset(asset: fruitAssetArray[index]), name: nameFruit?[0] ?? "error")
                fruitArray.append(fruit)
            }
        }
        return fruitArray
    }
    
    func getAllFruitAsset() -> [PHAsset] {
        var fruitCollection = PHAssetCollection()
        if PhotoManager.shared.fetchAllAlbum().count != 0{
            for item in PhotoManager.shared.fetchAllAlbum() {
                if item.localizedTitle == "Fruit" {
                    fruitCollection = item
                    break
                }
            }
        }
        return PhotoManager.shared.allAssetByAlbum(collection: fruitCollection)
    }
    
}

