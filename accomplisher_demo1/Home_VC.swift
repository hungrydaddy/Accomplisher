//
//  SecondViewController.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 3/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

var VC_home: Home_VC?

class Home_VC: UIViewController {

    var db: SQLiteDB!
    
    
    let profileView: userProfile = {
        let prof = userProfile()
        
        return prof
    }()
    
    
    @IBOutlet weak var circleView: progressCircle!
    
    @IBOutlet weak var previousData: UILabel!
    
    @IBOutlet weak var targetData: UILabel!
    
    @IBOutlet weak var targetDate: UILabel!
    
    @IBOutlet weak var bond: UILabel!
    
    @IBOutlet weak var circle_percentage: UILabel!
    
    @IBOutlet weak var label_daysRemaining: UILabel!
    
    @IBOutlet weak var weightChange: UILabel!
    
    @IBOutlet weak var bt_reTest: UIButton!
    
    @IBOutlet weak var bt_checkOut: UIButton!
    
    
    
    
    @IBAction func openMenu(_ sender: Any) {
        revealViewController().revealToggle(animated: true)
    }
    

    @IBAction func handle_reTest(_ sender: Any) {
        let readDataView = storyboard!.instantiateViewController(withIdentifier: "readData")
        navigationController?.show(readDataView, sender: nil)
    }
    
    
    @IBAction func handle_checkOut(_ sender: Any) {
        let checkOutView:UIViewController = storyboard!.instantiateViewController(withIdentifier: "checkOut")
        navigationController?.show(checkOutView, sender: nil)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        circleView.setNeedsDisplay()
        
        if setupData() == true {
            updateData()
        }else{
            //dont update
        }
    }
    
    
    override func viewDidLoad(){
        VC_home = self
        
        super.viewDidLoad()
        title = "Home"
        
        setupConstraints()
        //redraw the circle graph
        
        self.setColor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func setColor(){

        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
     
        

        //setting up the status bar stype
    }
    
    func updateData(){
        
        var result = db.query(sql: "select * from healthData")
        previousData.text = "previous weight: " + String(describing: result[result.count-1]["weight"]!) + "kg"
        //updating previous data
        guard result.count != 0 else {
            return
        }
        
        let previousWeight = Float(String(describing: result[result.count-1]["weight"]!))!
        
        result = db.query(sql: "SELECT * FROM targetData")
        
        guard result.count != 0 else {
            return
        }
        
        targetData.text = "target weight:" + String(describing: result[result.count-1]["targetWeight"]!) + "kg"
        
        let date = String(describing: result[result.count-1]["date"]!)
        targetDate.text = "target date: " + date.substring(to: date.index(date.startIndex, offsetBy: 10))
        bond.text = "$" + String(describing: result[result.count-1]["bond"]!)
        //updating target data
        
        let startWeight = Float(String(describing: result[result.count-1]["startWeight"]!))!
        let targetWeight = Float(String(describing: result[result.count-1]["targetWeight"]!))!
        
        
        setupProgress(startWeight: startWeight, targetWeight: targetWeight, previousWeight: previousWeight)
        
        updateDayRemaining()
        //unfinished
    }
    
    func setupProgress(startWeight: Float, targetWeight: Float, previousWeight: Float){
        if targetWeight <= startWeight {
            if previousWeight >= startWeight {
                weightChange.text = "work harder!"
                fitness_progress = 0
                circle_percentage.text = String(fitness_progress.rounded()) + "%"
            } else {
                weightChange.text = "-" + String((startWeight - previousWeight).rounded()) + " kg"
                fitness_progress = (startWeight - previousWeight) / (startWeight - targetWeight) * 100
                
                if fitness_progress > 100 {
                    fitness_progress = 100
                }
                
                circle_percentage.text = String((fitness_progress * 10).rounded()/10) + "%"
            }
            
            // target < start
        } else if targetWeight > startWeight {
            if previousWeight <= startWeight {
                weightChange.text = "work harder!"
                fitness_progress = 0
                circle_percentage.text = String(fitness_progress.rounded()) + "%"
            } else {
                weightChange.text = "+" + String((previousWeight - startWeight).rounded())
                + " kg"
                fitness_progress = (previousWeight - startWeight) / (targetWeight - startWeight) * 100
                
                if fitness_progress > 100 {
                    fitness_progress = 100
                }//cant over 100
                
                circle_percentage.text = String((fitness_progress * 10).rounded()/10) + "%"
            }
            // target > start
        }
        //processing data updates of the circle
    }

    
    func setupData() -> Bool{
        db = SQLiteDB.shared

        let readDataView: UIViewController = storyboard!.instantiateViewController(withIdentifier: "readData")
        let setGoalView: UIViewController = storyboard!.instantiateViewController(withIdentifier: "setGoal")
        
        
        var result = db.query(sql: "SELECT * FROM healthData")
        if result.count == 0 {
            //if there is no health data
            navigationController?.pushViewController(readDataView, animated: true)
            return false
        }
    
        result = db.query(sql: "SELECT * FROM targetData")
        if result.count == 0 {
            //if there is no target data
            navigationController?.pushViewController(setGoalView, animated: true)
            return false
        }
        
        return true


    }

    func updateDayRemaining(){

        let startingDate = NSDate().addingTimeInterval(11 * 3600)
        let result = db.query(sql: "select * from targetData")
        
        guard result.count != 0 else {
            label_daysRemaining.text = "nil"
            return
        }
        
        
        let date = String(describing: result[result.count-1]["date"]!)
        
        let daysFormatter = DateFormatter()
        daysFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let targetDate: Date! = daysFormatter.date(from: date)
        
        daysRemaining = daysBetweenDate(startDate: startingDate as Date, endDate: targetDate)
        
        
        label_daysRemaining.text = String(describing: daysRemaining!) + " days left"
    }
    
    
    func daysBetweenDate(startDate: Date, endDate: Date) -> Int {

        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        //print(components)
        
        return components.day! + 1
    }
    
    
    
    func setupConstraints(){
        setupCircle()
        setupBond()
        setupLabels()
        setupButton()
        setupProfile()
    }
    
    func setupButton(){
        
        
        bt_reTest.translatesAutoresizingMaskIntoConstraints = false
        bt_reTest.backgroundColor = defaultColor
        bt_reTest.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_reTest.topAnchor.constraint(equalTo: targetDate.bottomAnchor, constant: 24).isActive = true
        bt_reTest.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_reTest.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //bt retest
        
        
        bt_checkOut.translatesAutoresizingMaskIntoConstraints = false
        bt_checkOut.backgroundColor = defaultColor
        bt_checkOut.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_checkOut.topAnchor.constraint(equalTo: bt_reTest.bottomAnchor, constant: 12).isActive = true
        bt_checkOut.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_checkOut.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //bt checkout
    }
    
    func setupCircle(){
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -85).isActive = true
        circleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        circleView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        //the circle
        
        
        circle_percentage.translatesAutoresizingMaskIntoConstraints = false
        
        circle_percentage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        circle_percentage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        circle_percentage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        circle_percentage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        label_daysRemaining.translatesAutoresizingMaskIntoConstraints = false
        
        label_daysRemaining.topAnchor.constraint(equalTo: circle_percentage.bottomAnchor).isActive = true
        label_daysRemaining.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        label_daysRemaining.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label_daysRemaining.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        weightChange.translatesAutoresizingMaskIntoConstraints = false
        
        weightChange.topAnchor.constraint(equalTo: label_daysRemaining.bottomAnchor).isActive = true
        weightChange.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        weightChange.widthAnchor.constraint(equalToConstant: 100).isActive = true
        weightChange.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func setupBond(){
        bond.translatesAutoresizingMaskIntoConstraints = false
        
        bond.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bond.bottomAnchor.constraint(equalTo: circleView.topAnchor, constant: -12).isActive = true
        bond.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bond.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLabels(){
        previousData.translatesAutoresizingMaskIntoConstraints = false
        
        previousData.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        previousData.topAnchor.constraint(equalTo: circleView.bottomAnchor).isActive = true
        previousData.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        previousData.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        targetData.translatesAutoresizingMaskIntoConstraints = false
        
        targetData.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        targetData.topAnchor.constraint(equalTo: previousData.bottomAnchor).isActive = true
        targetData.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        targetData.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        targetDate.translatesAutoresizingMaskIntoConstraints = false
        
        targetDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        targetDate.topAnchor.constraint(equalTo: targetData.bottomAnchor).isActive = true
        targetDate.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        targetDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupProfile(){
        
        view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        profileView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        profileView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        
        
        profileView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handle_goToProfile))
        gesture.numberOfTapsRequired = 1
        profileView.addGestureRecognizer(gesture)
        
        //
    }
    
    func handle_goToProfile(){
        let view = storyboard?.instantiateViewController(withIdentifier: "profileDetails")
        
        present(view!, animated: true, completion: nil)
        
    }

}









































