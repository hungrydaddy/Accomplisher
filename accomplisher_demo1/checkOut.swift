//
//  checkOut.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 16/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class checkOut: UIViewController {

    let logoView:UIImageView = {
        let image = UIImage(named: "logo.png")
        let imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    @IBOutlet weak var bt_goCheck: UIButton!
    
    @IBOutlet weak var words: UILabel!
    
    @IBAction func handle_goCheck(_ sender: Any) {
        let readData: UIViewController = storyboard!.instantiateViewController(withIdentifier: "readData")
        navigationController?.show(readData, sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        //getBondVal()

        // Do any additional setup after loading the view.
    }

    
    
    /*
    func getBondVal(){
        var db = SQLiteDB.shared
        var result = db.query(sql: "SELECT * FROM targetData")
        guard result.count != 0 else {
            bondValue.text = "please set a target first"
            return
        }
        //print(String(describing: result[result.count-1]["bond"]!))
        bondValue.text = String(describing: result[result.count-1]["bond"]!)
    }
    
    */
    
    func setup(){
        setupWords()
        setupLogo()
        setupButton()
    }
    
    func setupLogo(){
        view.addSubview(logoView)
        
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoView.bottomAnchor.constraint(equalTo: words.topAnchor, constant: 12).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupButton(){
        bt_goCheck.translatesAutoresizingMaskIntoConstraints = false
        bt_goCheck.backgroundColor = defaultColor
        
        bt_goCheck.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_goCheck.topAnchor.constraint(equalTo: words.bottomAnchor).isActive = true
        bt_goCheck.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_goCheck.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupWords(){
        words.translatesAutoresizingMaskIntoConstraints = false
        words.textColor = defaultColor
        
        words.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        words.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        words.widthAnchor.constraint(equalToConstant: 200).isActive = true
        words.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
    }
    



}
