//
//  FruitDetailViewController.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/25/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit
import Cosmos

class FruitDetailViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var contentIntroduceLabel: UILabel!
    @IBOutlet weak var amountTitleLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var allergeneLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameFruitLabel: UILabel!
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingStarView: CosmosView!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var payView: UIView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var payImageView: UIImageView!
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var typeFruitView: UIView!
    
    var fruitData: Fruit?

    var viewModel = FruitDetailViewModel()
    var selectedIndex = Int()
    
    //MARK: Action
    @IBAction func touchIncreaseButton(_ sender: UIButton) {
        let count = Int(numberLabel.text ?? "0")!
        viewModel.increaseCount(count: count)
    }
    
    @IBAction func touchDecreaseButton(_ sender: UIButton) {
        let count = Int(numberLabel.text ?? "0")!
        viewModel.decreaseCount(count: count)
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setUI()
        setData()
        setCollectionViewDetailFruit()
        setRatingStarView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cornerRadiusUI()
    }
    
    //MARK: SetUI
    func setRatingStarView() {
        updateRating(requiredRating: nil)
        ratingStarView.didTouchCosmos = didTouchCosmos(_:)
        ratingStarView.didFinishTouchingCosmos = didFinishTouchingCosmos(_:)
    }
    
    func setCollectionViewDetailFruit() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "AllergeneCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllergeneCollectionViewCell")
    }
    
    func setData() {
        fruitImageView.image = fruitData?.imageFruit
        nameFruitLabel.text = fruitData?.nameFruit.rawValue
    }
    
    func cornerRadiusUI() {
        increaseButton.roundedButtonRight(width: 20, height: 20)
        decreaseButton.roundedButtonLeft(width: 20, height: 20)
        cartImageView.layer.cornerRadius = cartImageView.frame.height/2
        payView.layer.cornerRadius = payView.frame.height/2
    }
    
    func setUI() {
        ratingStarView.settings.updateOnTouch = false
        ratingStarView.settings.fillMode = .precise
        ratingStarView.settings.starSize = 20
        ratingStarView.settings.starMargin = 5
        ratingStarView.settings.filledColor = UIColor.orange
        ratingStarView.settings.emptyBorderColor = UIColor.orange
        ratingStarView.settings.filledBorderColor = UIColor.orange
        ratingStarView.settings.filledImage = UIImage(named: "GoldStarFilled")
        ratingStarView.settings.emptyImage = UIImage(named: "GoldStarEmpty")
        
        imageView.layer.cornerRadius = 25
        
        ratingView.layer.cornerRadius = 25
        
        fruitImageView.layer.cornerRadius = 10
        fruitImageView.contentMode = .scaleToFill
        fruitImageView.layer.masksToBounds = true
        
        introduceLabel.text = "Beschreibung"
        
        contentIntroduceLabel.text = ""
        
        amountTitleLabel.text = "Anzahl"
        
        amountView.layer.cornerRadius = 22
        amountView.dropShadow(color: UIColor.black, opacity: 0.5, offSet: CGSize(width: 0, height: 3), radius: 10, scale: true)
        
        increaseButton.layer.cornerRadius = 8
        increaseButton.setTitle("+", for: .normal)
        
        decreaseButton.layer.cornerRadius = 8
        decreaseButton.setTitle("-", for: .normal)
        
        numberLabel.text = "0"
        numberLabel.layer.masksToBounds = true
        
        allergeneLabel.text = "Allergene"
        
        typeLabel.layer.borderWidth = 0.5
        typeLabel.layer.cornerRadius = 20
        typeLabel.layer.masksToBounds = true
        
        typeFruitView.layer.cornerRadius = 20
        typeFruitView.dropShadow(color: UIColor.black, opacity: 0.5, offSet: CGSize(width: 0, height: 5), radius: 10, scale: true)
    
        payView.dropShadow(color: UIColor.black, opacity: 0.5, offSet: CGSize(width: 0, height: 5), radius: 10, scale: true)
        
        cartImageView.layer.borderWidth = 1
        cartImageView.layer.borderColor = UIColor.white.cgColor
        cartImageView.layer.masksToBounds = true
        
    }
    
}

//MARK: Setting rating star view
extension FruitDetailViewController {
    
    private func updateRating(requiredRating: Double?) {
        var newRatingValue: Double = 0
        if let nonEmptyRequiredRating = requiredRating {
            newRatingValue = nonEmptyRequiredRating
        }
        ratingStarView.rating = newRatingValue
        self.ratingLabel.text = roundingValue(ratingStarView.rating)
    }

    private func didTouchCosmos(_ rating: Double) {
        updateRating(requiredRating: rating)
        ratingLabel.text = roundingValue(rating)
    }

    private func didFinishTouchingCosmos(_ rating: Double) {
        self.ratingLabel.text = roundingValue(rating)
    }
    
}

//MARK: CollectionViewDelegate
extension FruitDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.collectionView.reloadData()
    }
    
}

//MARK: CollectionViewDataSource
extension FruitDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllergeneCollectionViewCell", for: indexPath) as? AllergeneCollectionViewCell else {
            return AllergeneCollectionViewCell()
        }
        cell.backgroundColor = selectedIndex == indexPath.row ? UIColor.brown : UIColor.white
        cell.checkTitleCell(index: indexPath.row)
        return cell
    }
    
}

//MARK: CollectionViewLayout
extension FruitDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width/3, height: 50)
    }
    
}

//MARK: Delegate
extension FruitDetailViewController: FruitDetailViewModelDelegate {
    
    func increase(count: Int) {
        numberLabel.text = String(count)
    }
    
    func decrease(count: Int) {
        numberLabel.text = String(count)
    }
    
}


