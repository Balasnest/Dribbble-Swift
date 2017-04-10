//
//  ShotCollectionViewCell.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit

class ShotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var shotName: UILabel!
    @IBOutlet weak var designerName: UILabel!
    @IBOutlet weak var designerIcon: UIImageView!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var viewUnitLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
        
        shotName.textColor = UIColor.cellLabelColor()
        designerName.textColor = UIColor.cellLabelColor()
        viewLabel.textColor = UIColor.cellLabelColor()
        viewUnitLabel.textColor = UIColor.cellLabelColor()
    }

}
