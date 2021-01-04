//
//  FruitCollectionViewCell.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/23/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

class FruitCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    var isActive:Bool = true
    let salePriceLabel = UILabel()
    var dataSetting = DataFruit()
    
    //MARK: Action
    @IBAction func touchFavoriteButton(_ sender: UIButton?) {
        if  isActive {
            isActive = false
            favoriteButton.setImage(UIImage(named:"heart-click"), for: .normal)
            favoriteButton.tintColor = UIColor.red

        } else {
            isActive = true
            favoriteButton.setImage( UIImage(named:"heart-normal"), for: .normal)
            favoriteButton.tintColor = UIColor.white
        }
        UserDefaultManager.shared.setInfor(data: UserDefaultManager.shared.data)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
    
    override func prepareForReuse() {
        favoriteButton.setImage( UIImage(named:"heart-normal"), for: .normal)
        favoriteButton.tintColor = UIColor.white
    }
    
    //MARK: SetUI
    func setUI() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        favoriteButton.layer.cornerRadius = 12
        favoriteButton.setImage(UIImage(named: "heart-normal"), for: .normal)
        favoriteButton.tintColor = UIColor.white
        
        storeButton.layer.cornerRadius = 8
        
        discountLabel.font = discountLabel.font.withSize(11)
        discountLabel.layer.cornerRadius = 8
        discountLabel.layer.masksToBounds = true

        salePriceLabel.font = salePriceLabel.font.withSize(15)
        salePriceLabel.frame = CGRect(x: 40, y: -13, width: 50, height: 50)
        salePriceLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        priceLabel.addSubview(salePriceLabel)
        
        noteLabel.text = "Price per kg"
    }
    
    func setContentCell(item: Fruit){
        dataSetting.ID = item.ID
        dataSetting.name = item.nameFruit.rawValue
        dataSetting.price = 10
        nameLabel.text = item.nameFruit.rawValue
        salePriceLabel.text = "$" + String(item.priceFruit ?? 0)
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: salePriceLabel.text!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        salePriceLabel.attributedText = attributeString
        priceLabel.text = "$" + String(item.priceFruit ?? 0)
        fruitImage.image = item.imageFruit
        switch item.nameFruit{
        case .apple:
            discountLabel.text = "FREE SHIP"
            discountLabel.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        case .banana:
            discountLabel.text = "SALE 12%"
            discountLabel.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case .notType, .orange, .pineapple, .mango, .watermelon:
            discountLabel.text = ""
            discountLabel.backgroundColor = nil
        }
    }
        
}

