//
//  FruitViewController.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/23/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit
import Photos

class FruitViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource = [Fruit]()
    
    var fruitViewModel = FruitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Fruit"
        setCollectionView()
        updateCollectionView()
    }
    
    func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "FruitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FruitCollectionViewCell")
    }
    
    func updateCollectionView() {
        fruitViewModel.checkPhotoLibrary() {[unowned self] fruit in
            self.dataSource = fruit
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension FruitViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fruitDetailViewController = FruitDetailViewController()
        fruitDetailViewController.fruitData = dataSource[indexPath.row]
        self.navigationController?.pushViewController(fruitDetailViewController, animated: true)
    }
    
}

extension FruitViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCollectionViewCell", for: indexPath) as? FruitCollectionViewCell else {
            return FruitCollectionViewCell()
        }
        let item = dataSource[indexPath.row]
        cell.setContentCell(item: item)
        return cell
    }
    
}

extension FruitViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 30)/2
        return CGSize(width: width, height: width*1.5)
    }
    
}

extension FruitViewController: FruitCollectionViewCellDelegate{
    func settingFavorite(cell: UICollectionViewCell) {
    }
}
