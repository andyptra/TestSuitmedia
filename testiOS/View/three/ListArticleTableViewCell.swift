//
//  ListArticleTableViewCell.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class ListArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    func setupUI() {
        
        let borderColor : UIColor = UIColor( red: 204.0, green: 204.0, blue:204.0, alpha: 1.0 )
        subView.layer.borderColor = borderColor.cgColor
        subView.layer.shadowColor = UIColor.black.cgColor
        subView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        subView.layer.shadowOpacity = 0.2
        subView.layer.shadowRadius = 15.0
        subView.layer.cornerRadius = 15.0//          subView.
        subView.layer.masksToBounds = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    class func nib() -> UINib {
        return UINib(nibName: "ListArticleTableViewCell", bundle: nil)
    }
}
