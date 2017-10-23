//
//  readHealthKit.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 3/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit
import HealthKit

class setGoal: UIViewController {

    
    var bondOptions = ["10", "20", "50", "100", "200"]
    
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var ratioSlider: UISlider!
    
    @IBOutlet weak var targetWeight: UILabel!
    
    @IBOutlet weak var targetRatio: UILabel!
    
    @IBOutlet weak var bt_set: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Set Goal"
        
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTarget(_ sender: Any) {
        
        let weightIn = (weightSlider.value).rounded()
        let ratioIn = (ratioSlider.value * 10).rounded() / 10
        
        let target: target_t = target_t.init(weight: weightIn, ratio: ratioIn, date: Date(), bond: 0)
        //working well
        user_target = target
        //print("target set")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nextVC = storyboard.instantiateViewController(withIdentifier: "setGoal_2")
        navigationController?.show(nextVC, sender: nil)
    }
    
    
    func setup(){
        setupConstraints()
        setSliders()
    
    }

    func setupConstraints(){
        targetWeight.translatesAutoresizingMaskIntoConstraints = false
        targetWeight.textAlignment = NSTextAlignment.left
        targetWeight.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        targetWeight.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        targetWeight.widthAnchor.constraint(equalToConstant: 250).isActive = true
        targetWeight.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //target weight label
        
        
        weightSlider.translatesAutoresizingMaskIntoConstraints = false
        weightSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        weightSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        weightSlider.heightAnchor.constraint(equalToConstant: 20).isActive = true
        weightSlider.topAnchor.constraint(equalTo: targetWeight.bottomAnchor, constant: 24).isActive = true
        //weight slider
    
        
        
        
        targetRatio.translatesAutoresizingMaskIntoConstraints = false
        targetRatio.textAlignment = NSTextAlignment.left
        targetRatio.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        targetRatio.topAnchor.constraint(equalTo: weightSlider.bottomAnchor, constant: 24).isActive = true
        targetRatio.widthAnchor.constraint(equalToConstant: 250).isActive = true
        targetRatio.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //target ratio label
        
        
        
        ratioSlider.translatesAutoresizingMaskIntoConstraints = false
        ratioSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        ratioSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        ratioSlider.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratioSlider.topAnchor.constraint(equalTo: targetRatio.bottomAnchor, constant: 24).isActive = true
        //ratio slider
        
        
        

        
        bt_set.translatesAutoresizingMaskIntoConstraints = false
        bt_set.setTitleColor(UIColor.white, for: .normal)
        bt_set.backgroundColor = defaultColor
        bt_set.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_set.topAnchor.constraint(equalTo: ratioSlider.bottomAnchor, constant: 24).isActive = true
        bt_set.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_set.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    func setSliders(){
        weightSlider.isContinuous = true
        weightSlider.maximumValue = 200
        weightSlider.minimumValue = 40
        weightSlider.value = 80
        
        ratioSlider.isContinuous = true
        ratioSlider.maximumValue = 50
        ratioSlider.minimumValue = 5
        ratioSlider.value = 20
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showTgtWeight(_ sender: Any) {
        let temp = weightSlider.value.rounded()
        
        targetWeight.text = "Target weight: " + String(temp) + "kg"
    }

    @IBAction func showTgtRatio(_ sender: Any) {
        var temp = ratioSlider.value * 10
        temp = temp.rounded() / 10
        
        targetRatio.text = "Target fat-ratio: " + String(temp) + "%"
    }
    

    
    func insertTarget(user_target: target_t){
        let db = SQLiteDB.shared
        
        let date = user_target.date!
        let weight = user_target.weight!
        let bond = user_target.bond!
        let ratio = user_target.ratio!
        
        let input_date = date.description.substring(to: date.description.index(date.description.startIndex, offsetBy: 10))
        //the date, string
        
        
        var query = db.query(sql: "select * from healthData")
        let previousWeight = Float(String(describing: query[query.count-1]["weight"]!))!
        
        
        _ = db.execute(sql: "insert into targetData (date, startWeight, targetWeight, bond, ratio) values ('\(input_date)', \(previousWeight),\(weight) ,\(bond), \(ratio))")
        //inserting the targetdata into database
        
        
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
