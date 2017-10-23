//
//  paymentMethod.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 5/4/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class paymentMethod: UIViewController {
    
    
    let paymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please select your payment:"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    

    let bt_wxPay: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultColor
        button.setTitle("wxPay", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handle_set), for: .touchUpInside)
        
        return button
    }()
    
    
    let bt_paypal: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultColor
        button.setTitle("Paypal", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handle_set), for: .touchUpInside)
        
        return button
    }()
    
    
    let bt_bank: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultColor
        button.setTitle("Bank card", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handle_set), for: .touchUpInside)
        
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Payment"
        
        setup()
        // Do any additional setup after loading the view.
    }

    
    func setup() {
        view.backgroundColor = UIColor.white
        setupLabel()
        setupButtons()
    }
    
    
    func setupLabel() {
        view.addSubview(paymentLabel)
        paymentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        paymentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        paymentLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        paymentLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    }
    
    

    func setupButtons() {
        view.addSubview(bt_wxPay)
        bt_wxPay.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_wxPay.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 60).isActive = true
        bt_wxPay.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_wxPay.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        view.addSubview(bt_paypal)
        bt_paypal.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_paypal.topAnchor.constraint(equalTo: bt_wxPay.bottomAnchor, constant: 24).isActive = true
        bt_paypal.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_paypal.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        view.addSubview(bt_bank)
        bt_bank.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_bank.topAnchor.constraint(equalTo: bt_paypal.bottomAnchor, constant: 24).isActive = true
        bt_bank.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_bank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    
    
    
    
    func insertTarget(user_target: target_t){
        let db = SQLiteDB.shared
        
        let date = user_target.date!
        let weight = user_target.weight!
        let bond = user_target.bond!
        let ratio = user_target.ratio!
        
        let input_date = date.description.substring(to: date.description.index(date.description.startIndex, offsetBy: 10))
        //the date, string
        
        
        var query = db.query(sql: "select * from healthData")
        let previousWeight = Float(String(describing: query[query.count-1]["weight"]!))!
        
        
        let result = db.execute(sql: "insert into targetData (date, startWeight, targetWeight, bond, ratio) values ('\(input_date)', \(previousWeight),\(weight) ,\(bond), \(ratio))")
        //inserting the targetdata into database
        
        if result != 0 {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    func handle_set(){

        self.insertTarget(user_target: user_target)
    }
    
    

}
