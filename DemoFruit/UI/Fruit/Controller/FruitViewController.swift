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
    
    //MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = FruitViewModel()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Fruit"
        setCollectionView()
        setViewModel()
    }
    
    func setViewModel(){
        viewModel.delegate = self
        viewModel.checkPhotoLibrary()
    }
    
    func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "FruitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FruitCollectionViewCell")
    }
    
}

//MARK: UIColectionViewDelegate
extension FruitViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fruitDetailViewController = FruitDetailViewController()
        fruitDetailViewController.viewModel.fruitData = viewModel.dataSource[indexPath.row]
        self.navigationController?.pushViewController(fruitDetailViewController, animated: true)
    }
    
}

//MARK: UICollectionViewDataSource
extension FruitViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCollectionViewCell", for: indexPath) as? FruitCollectionViewCell else {
            return FruitCollectionViewCell()
        }
        let item = viewModel.dataSource[indexPath.row]
        cell.setContentCell(item: item)
        return cell
    }
    
}

//MARK: UICollectionViewDelegateFlowLayout
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

//MARK: FruitCollectionViewCellDelegate
extension FruitViewController: FruitCollectionViewCellDelegate{
    func settingFavorite(cell: UICollectionViewCell) {
    }
}

//MARK: FruitViewModelDelegate
extension FruitViewController: FruitViewModelDelegate{
    func reloadData() {
        DispatchQueue.main.async {
           self.collectionView.reloadData()
        }
    }
}
