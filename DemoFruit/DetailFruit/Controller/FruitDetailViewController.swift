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
    

    var fruit: Fruit?
    var selectedIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        setCollectionViewDetailFruit()
        setRatingStarView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        increaseButton.roundedButtonRight(width: 20, height: 20)
        decreaseButton.roundedButtonLeft(width: 20, height: 20)
    }
    
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
        fruitImageView.image = fruit?.imageFruit
        nameFruitLabel.text = fruit?.nameFruit.rawValue
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
        fruitImageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        fruitImageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        fruitImageView.layer.shadowOpacity = 1.0
        fruitImageView.layer.shadowRadius = 10.0
        
        introduceLabel.text = "Beschreibung"
        contentIntroduceLabel.text = "trái là một phần của những loại thực vật có hoa, chuyển hóa từ những mô riêng biệt của hoa, có thể có một hoặc nhiều bầu nhụy và trong một số trường hợp thì là mô phụ"
        
        amountTitleLabel.text = "Anzahl"
        
        amountView.layer.cornerRadius = 22
        amountView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        amountView.layer.shadowOffset = CGSize(width: 0, height: 5)
        amountView.layer.shadowOpacity = 1.0
        amountView.layer.shadowRadius = 10
        amountView.layer.masksToBounds = false
        
        increaseButton.layer.cornerRadius = 8
        increaseButton.setTitle("+", for: .normal)
        
        decreaseButton.layer.cornerRadius = 8
        decreaseButton.setTitle("-", for: .normal)
        
        numberLabel.text = "5"
        numberLabel.layer.masksToBounds = true
        
        allergeneLabel.text = "Allergene"
        
        typeLabel.layer.borderWidth = 0.5
        typeLabel.layer.cornerRadius = 20
        typeLabel.layer.borderColor = UIColor.white.cgColor
        typeLabel.layer.masksToBounds = true
        typeLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        typeLabel.layer.shadowOffset = CGSize(width: 0, height: 5)
        typeLabel.layer.shadowOpacity = 1.0
        typeLabel.layer.shadowRadius = 10
        typeLabel.layer.masksToBounds = true
        
        payView.layer.cornerRadius = 25
        payView.layer.masksToBounds = true
        
        cartImageView.layer.cornerRadius = 20
        cartImageView.layer.borderWidth = 1
        cartImageView.layer.borderColor = UIColor.white.cgColor
        cartImageView.layer.masksToBounds = true
    }

}

// Setting rating star view
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
        ratingLabel.textColor = UIColor(red: 133/255, green: 116/255, blue: 154/255, alpha: 1)
    }
      
    private func didFinishTouchingCosmos(_ rating: Double) {
        self.ratingLabel.text = roundingValue(rating)
        ratingLabel.textColor = UIColor(red: 183/255, green: 186/255, blue: 204/255, alpha: 1)
    }
}

extension FruitDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.collectionView.reloadData()
    }
}

extension FruitDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllergeneCollectionViewCell", for: indexPath) as? AllergeneCollectionViewCell else {
            return AllergeneCollectionViewCell()
        }
        cell.backgroundColor = selectedIndex == indexPath.row ? UIColor.orange : UIColor.white
        cell.checkTitleCell(index: indexPath.row)
        return cell
    }

}

extension FruitDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width/3, height: 50)
    }
}



