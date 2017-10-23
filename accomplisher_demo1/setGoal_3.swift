//
//  setGoal_3.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 5/4/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class setGoal_3: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var bondOptions = ["10", "20", "50", "100", "200"]
    
    let label_bond: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bond:"
        
        return label
    }()
    
    
    let bt_set: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultColor
        button.setTitle("set", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handle_next), for: .touchUpInside)
        
        return button
    }()
    
    
    lazy var bondPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        
        
        return picker
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Set Bond"
        view.backgroundColor = UIColor.white
        setupBondPicker()
        setupButton()
        // Do any additional setup after loading the view.
    }

    
    func setupBondPicker() {
        view.addSubview(label_bond)
        label_bond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        label_bond.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        label_bond.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label_bond.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //finishdate label
        
        
        view.addSubview(bondPicker)
        bondPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bondPicker.topAnchor.constraint(equalTo: label_bond.bottomAnchor, constant: -24).isActive = true
        bondPicker.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bondPicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //bond picker
    
    }
    
    func setupButton() {
        view.addSubview(bt_set)
        bt_set.topAnchor.constraint(equalTo: bondPicker.bottomAnchor, constant: 50).isActive = true
        bt_set.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_set.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_set.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    
    }
    
    func setBond() {
        
        user_target.bond = Int(bondOptions[bondPicker.selectedRow(inComponent: 0)])
        
    }
    
    
    func handle_next() {
        let nextVC = paymentMethod()
        show(nextVC, sender: nil)
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bondOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bondOptions[row]
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}
