//
//  checkOutFailure.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 8/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class checkOutFailure: UIViewController {

    @IBOutlet weak var label_failure: UILabel!

    
    let label_reason: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reason Here"
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Failure"
        
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        setupConstraints()
        
    }
    
    
    
    func setupConstraints(){
        setupLabels()
    }
    
    func setupLabels(){
        label_failure.translatesAutoresizingMaskIntoConstraints = false
        label_failure.font = UIFont(name: label_failure.font.fontName, size: 30)
        label_failure.textAlignment = NSTextAlignment.center
        
        label_failure.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_failure.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        label_failure.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label_failure.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(label_reason)
        label_reason.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_reason.topAnchor.constraint(equalTo: label_failure.bottomAnchor, constant: 12).isActive = true
        label_reason.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label_reason.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label_reason.text = "Sorry, try harder!"
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
