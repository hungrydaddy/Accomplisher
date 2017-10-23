//
//  setGoal_2.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 18/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class setGoal_2: UIViewController {

    
    let label_startDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Start Date"
        label.font = UIFont(name: label.font.fontName, size: 15)
        label.textAlignment = NSTextAlignment.center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    
    let label_finishDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Finish Date"
        label.font = UIFont(name: label.font.fontName, size: 15)
        label.textAlignment = NSTextAlignment.center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    
    let bt_next: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultColor
        button.setTitle("next", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

        // Do any additional setup after loading the view.
    }

    
    
    @IBOutlet weak var picker_startDate: UIDatePicker!
    
    @IBOutlet weak var picker_finishDate: UIDatePicker!
    
    
    func setup(){
        setupConstraints()
        setDatePicker()
    }
    
    func setupConstraints(){
        view.addSubview(label_startDate)
        
        label_startDate.textAlignment = NSTextAlignment.left
        label_startDate.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        label_startDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        label_startDate.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label_startDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        view.addSubview(picker_startDate)
        
        picker_startDate.translatesAutoresizingMaskIntoConstraints = false
        picker_startDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker_startDate.topAnchor.constraint(equalTo: label_startDate.bottomAnchor).isActive = true
        picker_startDate.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        picker_startDate.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        view.addSubview(label_finishDate)
        
        label_finishDate.textAlignment = NSTextAlignment.left
        label_finishDate.topAnchor.constraint(equalTo: picker_startDate.bottomAnchor, constant: 24).isActive = true
        label_finishDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        label_finishDate.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label_finishDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        view.addSubview(picker_finishDate)
        
        picker_finishDate.translatesAutoresizingMaskIntoConstraints = false
        picker_finishDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker_finishDate.topAnchor.constraint(equalTo: label_finishDate.bottomAnchor).isActive = true
        picker_finishDate.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        picker_finishDate.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        view.addSubview(bt_next)
        
        bt_next.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_next.topAnchor.constraint(equalTo: picker_finishDate.bottomAnchor, constant: 24).isActive = true
        bt_next.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_next.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    
    
    func setDatePicker(){
        picker_finishDate.datePickerMode = UIDatePickerMode.date
        picker_finishDate.minimumDate = NSDate() as Date
    }

    
    func handleNext(){
        user_target.date = picker_finishDate.date
        let nextVC = setGoal_3()
        show(nextVC, sender: nil)
    }
}
