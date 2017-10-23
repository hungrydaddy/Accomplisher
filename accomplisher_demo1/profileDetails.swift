//
//  profileDetails.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 8/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class profileDetails: UIViewController {

    @IBOutlet weak var label_participation: UILabel!
    let profileView = userProfile()
    var backVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        setup()
        // Do any additional setup after loading the view.
    }


    func setup(){
        setupProfile()
        setupLabels()
        setupButtons()
    }
    
    func setupProfile(){
        
        view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -24).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        
        //
    }
    
    
    func setupLabels(){
        label_participation.translatesAutoresizingMaskIntoConstraints = false
        label_participation.textAlignment = NSTextAlignment.center
        
        
        
        label_participation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_participation.topAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
        label_participation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        label_participation.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    
    }

    
    func setupButtons(){
        let bt_back: UIButton = {
            let button = UIButton(type: UIButtonType.system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = defaultColor
            button.setTitle("Back", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
            
            
            return button
        }()
        
        view.addSubview(bt_back)
        
        bt_back.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_back.topAnchor.constraint(equalTo: label_participation.bottomAnchor, constant: 12).isActive = true
        bt_back.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_back.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    
    func dismissView(){
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    
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
