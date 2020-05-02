//
//  ViewController.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var palindromeTxt: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnCheck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnNextPressed(_ sender: Any) {

                      let vc = ScreenTwoViewController()
      
                      self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func updateUI() {
        let borderColor : UIColor = UIColor( red: 204.0, green: 204.0, blue:204.0, alpha: 1.0 )
        viewLogin.layer.borderColor = borderColor.cgColor
        viewLogin.layer.shadowColor = UIColor.black.cgColor
        viewLogin.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        viewLogin.layer.shadowOpacity = 0.2
        viewLogin.layer.shadowRadius = 15.0
        viewLogin.layer.cornerRadius = 15.0
        nameTxt.layer.cornerRadius = 20.0
        nameTxt.layer.borderWidth = 1
        nameTxt.layer.borderColor = borderColor.cgColor
        nameTxt.layer.masksToBounds = true
        
        palindromeTxt.layer.cornerRadius = 20.0
        palindromeTxt.layer.borderWidth = 1
        palindromeTxt.layer.borderColor = borderColor.cgColor
        palindromeTxt.layer.masksToBounds = true
        
        btnNext.layer.cornerRadius = 20.0
        btnCheck.layer.cornerRadius = 20.0

    }
    
    
}



