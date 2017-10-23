//
//  FirstViewController.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 3/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit
import HealthKit

class dailyTesting: UIViewController {
    
    @IBOutlet weak var readProgress: UILabel!
    
    @IBOutlet weak var bt_readHealthData: UIButton!
    
    @IBAction func bt_readHealthData(_ sender: Any) {
        readDatafromHealthKit()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Read Data"

        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func readDatafromHealthKit(){
        guard HKHealthStore.isHealthDataAvailable() else {
            print("No HealthKit on this device")
            return
        }
        
        // create a quantity type for storing body mass
        guard let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) else {
            print("Unable to create quantity type")
            return
        }
        
        // request authorization and save a sample of the type of healthkit data required
        HKHealthStore().requestAuthorization(toShare: [], read: [quantityType]) {
            okay, error in
            
            // error in requesting authorization
            if error != nil {
                return
            }
            
            // requested authorization and was denied
            if !okay {
                print("Not authorized to read weight HealtKit data")
                return
            }
            
            // create the query
            let weightQuery = HKSampleQuery.init(sampleType: quantityType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) {
                
                query, results, error in
                
                // error with query
                if error != nil {
                    print(error!)
                    return
                }
                
                // check for valid results
                guard let results = results else {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: "No results", preferredStyle: UIAlertControllerStyle.alert)
                        self.present(alert, animated: true, completion: nil)
                    }
                    return
                }
                
                // make sure there is at least one result to output
                if results.count == 0 {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: "No data in Health", preferredStyle: UIAlertControllerStyle.alert)
                        self.present(alert, animated: true, completion: nil)
                    }
                    return
                }
                
                // extract the one sample
                guard let bodymass = results[results.count - 1] as? HKQuantitySample else {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: "Type problem", preferredStyle: UIAlertControllerStyle.alert)
                        self.present(alert, animated: true, completion: nil)
                    }
                    return
                }
                //bodymass quantity is the weight
                
                //if source name is health, dont add
                
                
                /*
                guard bodymass.sourceRevision.source.name != "健康" else{
                    DispatchQueue.main.async {
                        self.readProgress.text = "please don't insert manually"
                    }
                    return
                }
                
                
                guard bodymass.sourceRevision.source.name != "Health" else{
                    DispatchQueue.main.async {
                        self.readProgress.text = "please don't insert manually"
                    }
                    return
                }
                */
                
                let weightKg = bodymass.quantity.doubleValue(for: HKUnit.gram()) / 1000
                
                self.insertWeight(weight: Float(weightKg), date: bodymass.startDate)
                //insert the weight and date into the local database
 

            }
            
            // execute the query
            HKHealthStore().execute(weightQuery)
        }
        
    }
    
    func insertWeight(weight: Float, date: Date){
        let db = SQLiteDB.shared
        
        let dateOfMeasure = date.description.substring(to: date.description.index(date.description.startIndex, offsetBy: 10))
        //the date, string
        
        let result = db.execute(sql: "insert into healthData (date, weight, ratio) values ('\(dateOfMeasure)', \(weight), 10.00)")
        
        
            
        if(result != 0) {
            //print("read success")
            DispatchQueue.main.async {
                self.updateData()
                
                self.readProgress.text = "successfully read"
                //print(fitness_progress)
                //self.navigationController?.popToRootViewController(animated: true)
            }
            
            DispatchQueue.main.async {
                let reportView = self.storyboard?.instantiateViewController(withIdentifier: "bodyReport")
                self.show(reportView!, sender: nil)
            }
            //send out a notification
        } else {
            //print("already read today")
            DispatchQueue.main.async {
                self.readProgress.text = "already read or no new data"
            }
        }
        //inserting existing data from healthkit to the local database, success
    }
    
    
    func updateData(){
        let db = SQLiteDB.shared
        
        var result = db.query(sql: "select * from healthData")
        //updating previous data
        guard result.count != 0 else {
            return
        }
        
        let previousWeight = Float(String(describing: result[result.count-1]["weight"]!))!
        
        result = db.query(sql: "SELECT * FROM targetData")
        
        guard result.count != 0 else {
            return
        }
        

        
        _ = String(describing: result[result.count-1]["date"]!)

        //updating target data
        
        let startWeight = Float(String(describing: result[result.count-1]["startWeight"]!))!
        let targetWeight = Float(String(describing: result[result.count-1]["targetWeight"]!))!
        
        
        targetDataProcess(startWeight: startWeight, targetWeight: targetWeight, previousWeight: previousWeight)
        
        //unfinished
    }
    
    func targetDataProcess(startWeight: Float, targetWeight: Float, previousWeight: Float){
        if targetWeight <= startWeight {
            if previousWeight >= startWeight {
                fitness_progress = 0
            } else {
                fitness_progress = (startWeight - previousWeight) / (startWeight - targetWeight) * 100
                fitness_progress = (fitness_progress * 10).rounded() / 10
                
                if fitness_progress > 100 {
                    fitness_progress = 100
                }
                
            }
            
            // target < start
        } else if targetWeight > startWeight {
            if previousWeight <= startWeight {
                fitness_progress = 0
            } else {
                fitness_progress = (previousWeight - startWeight) / (targetWeight - startWeight) * 100
                fitness_progress = (fitness_progress * 10).rounded() / 10
                
                if fitness_progress > 100 {
                    fitness_progress = 100
                }//cant over 100
                
            }
            // target > start
        }
        //processing data updates of the circle
    }
    
    
    func setup(){
        bt_readHealthData.translatesAutoresizingMaskIntoConstraints = false
        bt_readHealthData.backgroundColor = defaultColor
        bt_readHealthData.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_readHealthData.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        bt_readHealthData.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        bt_readHealthData.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        readProgress.translatesAutoresizingMaskIntoConstraints = false
        readProgress.textAlignment = NSTextAlignment.center
        readProgress.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        readProgress.topAnchor.constraint(equalTo: bt_readHealthData.bottomAnchor, constant: 12).isActive = true
        readProgress.heightAnchor.constraint(equalToConstant: 20).isActive = true
        readProgress.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }

    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.navigationController != nil{
            // in the background
        }else{
            // closed
            // deinit
            self.view = nil
        }
    }
}

