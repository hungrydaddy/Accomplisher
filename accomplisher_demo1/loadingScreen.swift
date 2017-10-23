//
//  loadingScreen.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 1/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit


class loadingScreen: UIViewController {

    
    let logoView:UIImageView = {
        let path = Bundle.main.path(forResource: "logo", ofType: "png")
        let image = UIImage(contentsOfFile: path!)
        let imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @IBOutlet weak var bt_enter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = defaultColor
        setupConstraints()
        
        setupData()
        // Do any additional setup after loading the view.
    }
    
    
    func setupConstraints(){
        setupButton()
        setupLogo()
        
    }
    
    
    func setupButton(){
        bt_enter.translatesAutoresizingMaskIntoConstraints = false
        bt_enter.setTitleColor(UIColor.white, for: .normal)
        
        bt_enter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_enter.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bt_enter.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bt_enter.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupLogo(){
        view.addSubview(logoView)
        
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoView.bottomAnchor.constraint(equalTo: bt_enter.topAnchor, constant: -12).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupData(){
        let db = SQLiteDB.shared
        _ = db.execute(sql: "CREATE TABLE IF NOT EXISTS healthData(id INTEGER PRIMARY KEY AUTOINCREMENT, date DATE,weight FLOAT,ratio FLOAT)")
        _ = db.execute(sql: "CREATE TABLE IF NOT EXISTS targetData(id INTEGER PRIMARY KEY AUTOINCREMENT, date DATE, startWeight FLOAT, targetWeight FLOAT, bond INTEGER, ratio FLOAT)")
        _ = db.execute(sql: "CREATE TABLE IF NOT EXISTS userData(id INTEGER PRIMARY KEY AUTOINCREMENT, nickname VARCHAR(50))")
        
        //user name assignment
        let result = db.query(sql: "SELECT nickname FROM userData")
        if result.count == 0 {
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let loginVC = LoginScreen()
                self.present(loginVC, animated: true, completion: nil)
            }
            
            
        } else {
            userName = String(describing: result[result.count - 1]["nickname"]!)
        }
        
    }

}
