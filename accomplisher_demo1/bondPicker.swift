//
//  bondPicker.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 10/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class bondPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var bondOptions = ["10", "20", "50", "100"]
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bondOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bondOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
