//
//  FruitCollectionViewCell.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/23/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

class FruitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    let salePriceLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
    
    func setUI() {
        //FruitCollectionViewCell
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        favoriteButton.setTitle("♡", for: .normal)
        favoriteButton.layer.cornerRadius = 12
        
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
        nameLabel.text = item.nameFruit.rawValue
        let number = item.priceFruit! as NSNumber
        salePriceLabel.text = "$" + number.stringValue
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: salePriceLabel.text!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        salePriceLabel.attributedText = attributeString
        priceLabel.text = "$" + number.stringValue
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
