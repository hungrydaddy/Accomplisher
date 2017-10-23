//
//  LoginScreen.swift
//  gameOfChats
//
//  Created by Austin & Rachel on 25/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController, UITextFieldDelegate {
    
    //declaration area
    var VC_menu: menu?
    
    lazy var bt_register: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        //just set this attribute to false everytime creating something programmatically
        //otherwise the constraints wont work properly
        
        return button
    }()
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.mask?.clipsToBounds = true
        
        return view
    }()
    var inputContainerViewHeightConstraint: NSLayoutConstraint?
    
    let nameBox: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = UIKeyboardType.default
        
        return tf
    }()


    let appTitle: UILabel = {
        let label = UILabel()
        label.text = "Enter name:"
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        view.backgroundColor = defaultColor
        
        
        nameBox.delegate = self
        //delegating the textfields to this controller
        
        setupInputContainerView()
        setupRegisterButton()
        setupTitle()
        //setupSegmentedControl()
    }
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        //setting the status bar style
    }
    
    
    
    
    func setupInputContainerView(){
        view.addSubview(inputContainerView)
        
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerViewHeightConstraint = inputContainerView.heightAnchor.constraint(equalToConstant: 50)
        inputContainerViewHeightConstraint?.isActive = true
        //background of the container
        
        
        inputContainerView.addSubview(nameBox)
        nameBox.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameBox.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameBox.rightAnchor.constraint(equalTo: inputContainerView.rightAnchor).isActive = true
        nameBox.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor).isActive = true
        
        
    }
 
    
    
    func setupRegisterButton(){
        view.addSubview(bt_register)
        
        bt_register.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_register.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        bt_register.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        bt_register.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bt_register.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
    }
    
    
    func setupTitle(){
        view.addSubview(appTitle)
        
        appTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appTitle.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -70).isActive = true
        appTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        appTitle.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
    }
    


    
    func handleLogin(){
        let db = SQLiteDB.shared
        
        if let name = nameBox.text {
            _ = db.execute(sql: "INSERT INTO userData (nickname) VALUES ('\(name)')")
            
        } else {
            db.alert(msg: "empty emailbox")
            return
        }
        
        //after logging in, load the name
        let result = db.query(sql: "SELECT nickname FROM userData")
        userName = String(describing: result[result.count - 1]["nickname"]!)
        
        
        //updating the name to other VCs
        VC_home?.profileView.userNameLabel.text = userName
        VC_menu?.profileView.userNameLabel.text = userName
        dismiss(animated: true, completion: nil)
    }
    
      /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameBox.resignFirstResponder()
        
        return true
    }
    //tapping return will hide the keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    //touching elsewhere will hide the keyboard
}



