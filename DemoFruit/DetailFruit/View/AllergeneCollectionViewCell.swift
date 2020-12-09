//
//  AllergeneCollectionViewCell.swift
//  DemoFruit
//
//  Created by PhanDinhNguyen on 11/26/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

class AllergeneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var allergeneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 22
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 10
        layer.masksToBounds = false
    }
    
    func checkTitleCell(index: Int) {
        switch index {
        case 0:
            allergeneLabel.text = "Soja"
        case 1:
            allergeneLabel.text = "Senf"
        case 2:
            allergeneLabel.text = "Avocado"
        default:
            allergeneLabel.text = ""
        }
    }

}
