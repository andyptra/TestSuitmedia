//
//  SreenFourViewController.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit
import SDWebImage
class SreenFourViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var estimateWidth = 160.0
    var cellMarginSize = 20.0
    var data : [GetDataUserModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getListData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    
}

extension SreenFourViewController{
    func getListData() {
        GetList.shared.getListData(){ result, error in
            if error != nil {
                
            }else{
                guard let data = result else { return }
                
                do {
                    let dataObject = try JSONDecoder().decode(GetUserModel.self, from: data)
                    if let data = dataObject.data{
                        self.data.append(contentsOf: data)
                    }
                    self.collectionView.reloadData()
                }catch{
                    print(error)
                }
            }
        }
    }
    @objc func tapSelector(sender: CustomTapGestureRecognizer) {
        print(sender.iD!)
        
        var message : String?
        if sender.iD! % 2 == 0 {
            message = "BlackBerry"
        } else if sender.iD! % 3 == 0 {
            message = "BlackBerry"
        } else if sender.iD! % 2 == 0 && sender.iD! % 3 == 0 {
            message = "iOS"
        } else {
            message = "feature phones"
        }
        
        let refreshAlert = UIAlertController(title: "Your Phone", message: "\(message!)", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            let vc = ScreenTwoViewController()
            vc.message = sender.nameHuman
            self.navigationController?.pushViewController(vc, animated: false)
            let nameAlt = "Andy"
            print("\(sender.nameHuman ?? nameAlt)")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: false, completion: nil)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
}

extension SreenFourViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupUI(){
        self.title = "GUEST";
        self.collectionView.register(ListUserCollectionViewCell.nib(), forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.setupGridView()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ListUserCollectionViewCell
        if let url = URL(string: "\(data[indexPath.row].avatar!)") {
            cell.imageAva.sd_setImage(with: url, completed: nil)
        }
        let tap = CustomTapGestureRecognizer(target: self, action: #selector(tapSelector(sender:)))
        tap.iD = data[indexPath.row].id
        tap.nameHuman = "\(data[indexPath.row].first_name!)"
        cell.MainView.addGestureRecognizer(tap)
        cell.nameLbl.text = "\(data[indexPath.row].first_name!)  \(data[indexPath.row].last_name!)"
        return cell
    }
    
    
}

extension SreenFourViewController :  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}

class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var iD : Int?
    var nameHuman : String?
}

