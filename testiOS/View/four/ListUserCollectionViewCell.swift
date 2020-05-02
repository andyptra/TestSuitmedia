//
//  ListUserCollectionViewCell.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class ListUserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var imageAva: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageAva.setRounded()
    }
    class func nib() -> UINib {
        return UINib(nibName: "ListUserCollectionViewCell", bundle: nil)
    }
}
