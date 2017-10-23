//
//  startNewConfirm.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 18/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class startNewConfirm: UIViewController {

    let label_warning: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You will lose current completion, continue?"
        label.font = UIFont(name: label.font.fontName, size: 15)
        label.textAlignment = NSTextAlignment.center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    
    
    let bt_startNew: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultColor
        button.setTitle("confirm", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handle_startNew), for: .touchUpInside)
        
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm"
        
        setup()
        // Do any additional setup after loading the view.
    }

    
    func setup(){
        view.backgroundColor = UIColor.white
        setupLabel()
        setupButton()
    }
    
    func setupLabel(){
        view.addSubview(label_warning)
        
        label_warning.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_warning.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        label_warning.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label_warning.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    func setupButton(){
        view.addSubview(bt_startNew)
        
        bt_startNew.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_startNew.topAnchor.constraint(equalTo: label_warning.bottomAnchor).isActive = true
        bt_startNew.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_startNew.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func handle_startNew(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "setGoal")
        navigationController?.show(nextVC, sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
