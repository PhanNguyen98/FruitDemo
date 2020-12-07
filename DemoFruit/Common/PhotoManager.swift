//
//  PhotoManager.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/25/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import Foundation
import Photos
import UIKit

class PhotoManager {
    static let shared = PhotoManager()
    
    func fetchAllAlbum() -> [PHAssetCollection] {
        // get album
        var datasource: [PHAssetCollection] = []
        let smartAlbum = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
        smartAlbum.enumerateObjects{(collection, _, _) in
            datasource.append(collection)
        }
        return datasource
    }
    
    
    func allAssetByAlbum(collection : PHAssetCollection) -> [PHAsset] {
        // get all photo of album
        var allPhoto = [PHAsset]()
        let allPhotoOfAlbum = PHAsset.fetchAssets(in: collection, options: nil)
        allPhotoOfAlbum.enumerateObjects { (photo, _, _) in
            allPhoto.append(photo)
        }
        return allPhoto
    }
    
    func getImageForAsset(asset : PHAsset) -> UIImage {
        //get Image from Asset
        var resultImg = UIImage()
        let screenBound = UIScreen.main.bounds
        let width = screenBound.width
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize.init(width: width/2, height: width*2/5), contentMode: PHImageContentMode.aspectFill, options: nil, resultHandler: {(result, info) -> Void in resultImg = result!})
        return resultImg
    }
    
}
