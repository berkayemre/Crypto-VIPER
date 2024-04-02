//
//  DetailVC.swift
//  Crypto-VIPER
//
//  Created by Berkay Emre Aslan on 1.04.2024.
//

import Foundation
import UIKit



class DetailVC : UIViewController {
    
    var currency : String = ""
    var price : String = ""
    
    private let priceLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Price Label"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let currencyLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Currency Label"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(currencyLabel)
        view.addSubview(priceLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        priceLabel.frame = CGRect(x: view.frame.width / 2 - 100 , y: view.frame.height / 2, width: 200, height: 170)
        currencyLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
        
        
        priceLabel.text = price
        currencyLabel.text = currency
        
        priceLabel.isHidden = false
        currencyLabel.isHidden = false
    }
  
}
