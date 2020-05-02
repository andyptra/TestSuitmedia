//
//  ScreenTwoViewController.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class ScreenTwoViewController: UIViewController {
    
    @IBOutlet weak var btnGuest: UIButton!
    @IBOutlet weak var btnEvent: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    var message : String?
     var titleLbl : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // Do any additional setup after loading the view.
        
    }
    func updateUI() {
        btnGuest.layer.cornerRadius = 20.0
        btnEvent.layer.cornerRadius = 20.0
        let nameAlt = "Andy"
        nameLbl.text = message ?? nameAlt
        let event = "Choose Event"
        btnEvent.setTitle("\(titleLbl ?? event)", for: .normal)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func btnChooseGuestPressed(_ sender: Any) {
        let vc = SreenFourViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnChoseeEventPressed(_ sender: Any) {
        let vc = ScreenThreeViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
