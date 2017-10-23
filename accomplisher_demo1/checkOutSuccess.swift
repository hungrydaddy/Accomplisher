//
//  checkOutResultViewController.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 8/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class checkOutSuccess: UIViewController {

    @IBOutlet weak var label_success: UILabel!
    
    
    
    let label_reason: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reason Here"
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
        button.setTitle("start new", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handle_restart), for: .touchUpInside)
        
        return button
    }()
    
    
    let bt_startBreak: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultColor
        button.setTitle("have a break", for: .normal)
        button.setTitleColor(defaultColor, for: UIControlState.selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action: #selector(handle_startBreak), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Success"
        
        setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handle_restart(){
        let nextVC = startNewConfirm()
        show(nextVC, sender: nil)
        //do things to start a new one
    }
    
    
    
    func handle_startBreak() {
        fitness_progress = 0
        navigationController?.popToRootViewController(animated: true)
    }
    
    func setup(){
        setupConstraints()
    
    }

    
    func setupConstraints(){
        setupLabels()
        setupButtons()
    }
    
    
    func setupLabels(){
        label_success.translatesAutoresizingMaskIntoConstraints = false
        label_success.font = UIFont(name: label_success.font.fontName, size: 30)
        label_success.textAlignment = NSTextAlignment.center
        
        label_success.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_success.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        label_success.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label_success.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        
        
        view.addSubview(label_reason)
        label_reason.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_reason.topAnchor.constraint(equalTo: label_success.bottomAnchor, constant: 12).isActive = true
        label_reason.widthAnchor.constraint(equalToConstant: 250).isActive = true
        label_reason.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label_reason.text = "Show this to our staff members to get your reward!"
    }
    
    
    func setupButtons(){
        view.addSubview(bt_startNew)
        bt_startNew.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_startNew.topAnchor.constraint(equalTo: label_reason.bottomAnchor, constant: 24).isActive = true
        bt_startNew.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_startNew.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        view.addSubview(bt_startBreak)
        bt_startBreak.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_startBreak.topAnchor.constraint(equalTo: bt_startNew.bottomAnchor, constant: 24).isActive = true
        bt_startBreak.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_startBreak.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
