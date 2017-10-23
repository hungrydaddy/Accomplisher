//
//  bodyReport.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 2/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit
import HealthKit

class bodyReport: UIViewController {

    

    @IBOutlet weak var labelProgress: UILabel!
    
    @IBOutlet weak var currentLabel: UILabel!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    let graph: UIView = {
        let graph = progressCircle()
        graph.backgroundColor = UIColor.white
        graph.translatesAutoresizingMaskIntoConstraints = false
    
        return graph
    }()
    
    
    let graphProgress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Body Report"
        
        setup()
    }
    
    
    func setup(){
        setupGraph()
        setupCurrentLabel()
        setupCurrentIcons()
        setupTargetLabel()
        setupTargetIcons()
        setupButtons()
    }
    
    
    func setupGraph(){
        view.addSubview(graph)
        
        graph.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        graph.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        graph.widthAnchor.constraint(equalToConstant: 150).isActive = true
        graph.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        view.addSubview(graphProgress)
        
        graphProgress.centerXAnchor.constraint(equalTo: graph.centerXAnchor).isActive = true
        graphProgress.centerYAnchor.constraint(equalTo: graph.centerYAnchor).isActive = true
        graphProgress.widthAnchor.constraint(equalTo: graph.widthAnchor).isActive = true
        graphProgress.heightAnchor.constraint(equalToConstant: 40).isActive = true
        graphProgress.text = String(fitness_progress)+"%"
        
        view.addSubview(labelProgress)
        labelProgress.translatesAutoresizingMaskIntoConstraints = false
        
        labelProgress.bottomAnchor.constraint(equalTo: graphProgress.topAnchor).isActive = true
        labelProgress.centerXAnchor.constraint(equalTo: graph.centerXAnchor).isActive = true
        labelProgress.widthAnchor.constraint(equalTo: graph.widthAnchor).isActive = true
        labelProgress.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupCurrentLabel(){
        currentLabel.translatesAutoresizingMaskIntoConstraints = false
        currentLabel.textAlignment = NSTextAlignment.center
        
        currentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currentLabel.topAnchor.constraint(equalTo: graph.bottomAnchor, constant: 12).isActive = true
        currentLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        currentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupTargetLabel(){
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        targetLabel.textAlignment = NSTextAlignment.center
        
        targetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        targetLabel.topAnchor.constraint(equalTo: currentLabel.bottomAnchor, constant: 100).isActive = true
        targetLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        targetLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupCurrentIcons(){
        
        /*
        var path = Bundle.main.path(forResource: "height", ofType: "png")
        let heightIcon = UIImage(contentsOfFile: path!)
        let heightView = UIImageView(image: heightIcon)
        view.addSubview(heightView)
        heightView.translatesAutoresizingMaskIntoConstraints = false
        
        heightView.topAnchor.constraint(equalTo: currentLabel.bottomAnchor).isActive = true
        heightView.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        heightView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        heightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //height
        
        */
        
        let path = Bundle.main.path(forResource: "bodyWeight", ofType: "png")
        let weightIcon = UIImage(contentsOfFile: path!)
        let weightView = UIImageView(image: weightIcon)
        view.addSubview(weightView)
        weightView.translatesAutoresizingMaskIntoConstraints = false
        
        weightView.topAnchor.constraint(equalTo: currentLabel.bottomAnchor).isActive = true
        weightView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weightView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //weight
        
        /*
        
        path = Bundle.main.path(forResource: "bodyFat", ofType: "png")
        let ratioIcon = UIImage(contentsOfFile: path!)
        let ratioView = UIImageView(image: ratioIcon)
        view.addSubview(ratioView)
        ratioView.translatesAutoresizingMaskIntoConstraints = false
        
        ratioView.topAnchor.constraint(equalTo: currentLabel.bottomAnchor).isActive = true
        ratioView.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 15).isActive = true
        ratioView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ratioView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //fat
        
        
        
        path = Bundle.main.path(forResource: "bmi", ofType: "png")
        let bmiIcon = UIImage(contentsOfFile: path!)
        let bmiView = UIImageView(image: bmiIcon)
        view.addSubview(bmiView)
        bmiView.translatesAutoresizingMaskIntoConstraints = false
        
        bmiView.topAnchor.constraint(equalTo: currentLabel.bottomAnchor).isActive = true
        bmiView.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        bmiView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bmiView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //bmi
        
        
        
        
        let heightLabel = UILabel()
        view.addSubview(heightLabel)
        heightLabel.text = "Height"
        heightLabel.font = UIFont(name: heightLabel.font.fontName, size: 15)
        heightLabel.textAlignment = NSTextAlignment.center
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        heightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        heightLabel.centerXAnchor.constraint(equalTo: heightView.centerXAnchor).isActive = true
        heightLabel.topAnchor.constraint(equalTo: heightView.bottomAnchor).isActive = true
        //height label
        
        */
        
    
        
        let weightLabel = UILabel()
        view.addSubview(weightLabel)
        weightLabel.text = "Weight"
        weightLabel.font = UIFont(name: weightLabel.font.fontName, size: 15)
        weightLabel.textAlignment = NSTextAlignment.center
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        weightLabel.centerXAnchor.constraint(equalTo: weightView.centerXAnchor).isActive = true
        weightLabel.topAnchor.constraint(equalTo: weightView.bottomAnchor).isActive = true
        //weight label
        
        
        /*
        
        let ratioLabel = UILabel()
        view.addSubview(ratioLabel)
        ratioLabel.text = "Fat"
        ratioLabel.font = UIFont(name: ratioLabel.font.fontName, size: 15)
        ratioLabel.textAlignment = NSTextAlignment.center
        ratioLabel.translatesAutoresizingMaskIntoConstraints = false
        ratioLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ratioLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratioLabel.centerXAnchor.constraint(equalTo: ratioView.centerXAnchor).isActive = true
        ratioLabel.topAnchor.constraint(equalTo: ratioView.bottomAnchor).isActive = true
        //ratio label
        
        
        
        
        let bmiLabel = UILabel()
        view.addSubview(bmiLabel)
        bmiLabel.text = "BMI"
        bmiLabel.font = UIFont(name: bmiLabel.font.fontName, size: 15)
        bmiLabel.textAlignment = NSTextAlignment.center
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        bmiLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        bmiLabel.centerXAnchor.constraint(equalTo: bmiView.centerXAnchor).isActive = true
        bmiLabel.topAnchor.constraint(equalTo: bmiView.bottomAnchor).isActive = true
        //ratio label
        
        
        */
        
        let db = SQLiteDB.shared
        
        var result = db.query(sql: "SELECT * FROM healthData")
        
        /*
        
        let heightDataLabel = UILabel()
        view.addSubview(heightDataLabel)
        heightDataLabel.text = "nil"
        heightDataLabel.font = UIFont(name: heightDataLabel.font.fontName, size: 14)
        heightDataLabel.textAlignment = NSTextAlignment.center
        heightDataLabel.translatesAutoresizingMaskIntoConstraints = false
        heightDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        heightDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        heightDataLabel.centerXAnchor.constraint(equalTo: heightLabel.centerXAnchor).isActive = true
        heightDataLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor).isActive = true
        //height label
        
        */
        
        let weightDataLabel = UILabel()
        view.addSubview(weightDataLabel)
        weightDataLabel.text = String(describing: result[result.count-1]["weight"]!) + "kg"
        weightDataLabel.font = UIFont(name: weightDataLabel.font.fontName, size: 14)
        weightDataLabel.textAlignment = NSTextAlignment.center
        weightDataLabel.translatesAutoresizingMaskIntoConstraints = false
        weightDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        weightDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        weightDataLabel.centerXAnchor.constraint(equalTo: weightLabel.centerXAnchor).isActive = true
        weightDataLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor).isActive = true
        //weight label
        
        
        
        /*
        let ratioDataLabel = UILabel()
        view.addSubview(ratioDataLabel)
        ratioDataLabel.text = "nil"
        ratioDataLabel.font = UIFont(name: ratioDataLabel.font.fontName, size: 14)
        ratioDataLabel.textAlignment = NSTextAlignment.center
        ratioDataLabel.translatesAutoresizingMaskIntoConstraints = false
        ratioDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ratioDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratioDataLabel.centerXAnchor.constraint(equalTo: ratioLabel.centerXAnchor).isActive = true
        ratioDataLabel.topAnchor.constraint(equalTo: ratioLabel.bottomAnchor).isActive = true
        //ratio label
        
        
        
        
        let bmiDataLabel = UILabel()
        view.addSubview(bmiDataLabel)
        bmiDataLabel.text = "nil"
        bmiDataLabel.font = UIFont(name: bmiDataLabel.font.fontName, size: 14)
        bmiDataLabel.textAlignment = NSTextAlignment.center
        bmiDataLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        bmiDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        bmiDataLabel.centerXAnchor.constraint(equalTo: bmiLabel.centerXAnchor).isActive = true
        bmiDataLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor).isActive = true
        //bmi label
        
        */
    }

    
    
    
    func setupTargetIcons(){
        /*
        var path = Bundle.main.path(forResource: "height_t", ofType: "png")
        let heightIcon = UIImage(contentsOfFile: path!)
        let heightView = UIImageView(image: heightIcon)
        view.addSubview(heightView)
        heightView.translatesAutoresizingMaskIntoConstraints = false
        
        heightView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor).isActive = true
        heightView.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        heightView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        heightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //height
        
        */
        
        let path = Bundle.main.path(forResource: "bodyWeight_t", ofType: "png")
        let weightIcon = UIImage(contentsOfFile: path!)
        let weightView = UIImageView(image: weightIcon)
        view.addSubview(weightView)
        weightView.translatesAutoresizingMaskIntoConstraints = false
        
        weightView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor).isActive = true
        weightView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weightView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //weight
        
        
        /*
        path = Bundle.main.path(forResource: "bodyFat_t", ofType: "png")
        let ratioIcon = UIImage(contentsOfFile: path!)
        let ratioView = UIImageView(image: ratioIcon)
        view.addSubview(ratioView)
        ratioView.translatesAutoresizingMaskIntoConstraints = false
        
        ratioView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor).isActive = true
        ratioView.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 15).isActive = true
        ratioView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ratioView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //fat
        
        
        
        path = Bundle.main.path(forResource: "bmi_t", ofType: "png")
        let bmiIcon = UIImage(contentsOfFile: path!)
        let bmiView = UIImageView(image: bmiIcon)
        view.addSubview(bmiView)
        bmiView.translatesAutoresizingMaskIntoConstraints = false
        
        bmiView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor).isActive = true
        bmiView.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        bmiView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bmiView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //bmi
        
        
        
        
        
        let heightLabel = UILabel()
        view.addSubview(heightLabel)
        heightLabel.text = "Height"
        heightLabel.font = UIFont(name: heightLabel.font.fontName, size: 15)
        heightLabel.textAlignment = NSTextAlignment.center
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        heightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        heightLabel.centerXAnchor.constraint(equalTo: heightView.centerXAnchor).isActive = true
        heightLabel.topAnchor.constraint(equalTo: heightView.bottomAnchor).isActive = true
        //height label
        
        
        */
        let weightLabel = UILabel()
        view.addSubview(weightLabel)
        weightLabel.text = "Weight"
        weightLabel.font = UIFont(name: weightLabel.font.fontName, size: 15)
        weightLabel.textAlignment = NSTextAlignment.center
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        weightLabel.centerXAnchor.constraint(equalTo: weightView.centerXAnchor).isActive = true
        weightLabel.topAnchor.constraint(equalTo: weightView.bottomAnchor).isActive = true
        //weight label
        
        /*
        
        let ratioLabel = UILabel()
        view.addSubview(ratioLabel)
        ratioLabel.text = "Fat"
        ratioLabel.font = UIFont(name: ratioLabel.font.fontName, size: 15)
        ratioLabel.textAlignment = NSTextAlignment.center
        ratioLabel.translatesAutoresizingMaskIntoConstraints = false
        ratioLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ratioLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratioLabel.centerXAnchor.constraint(equalTo: ratioView.centerXAnchor).isActive = true
        ratioLabel.topAnchor.constraint(equalTo: ratioView.bottomAnchor).isActive = true
        //ratio label
        
        
        
        
        let bmiLabel = UILabel()
        view.addSubview(bmiLabel)
        bmiLabel.text = "BMI"
        bmiLabel.font = UIFont(name: bmiLabel.font.fontName, size: 15)
        bmiLabel.textAlignment = NSTextAlignment.center
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        bmiLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        bmiLabel.centerXAnchor.constraint(equalTo: bmiView.centerXAnchor).isActive = true
        bmiLabel.topAnchor.constraint(equalTo: bmiView.bottomAnchor).isActive = true
        //ratio label
        
        
        
        */
        
        let db = SQLiteDB.shared
        
        var result = db.query(sql: "SELECT * FROM targetData")
        
        /*
        
        let heightDataLabel = UILabel()
        view.addSubview(heightDataLabel)
        heightDataLabel.text = "nil"
        heightDataLabel.font = UIFont(name: heightDataLabel.font.fontName, size: 14)
        heightDataLabel.textAlignment = NSTextAlignment.center
        heightDataLabel.translatesAutoresizingMaskIntoConstraints = false
        heightDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        heightDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        heightDataLabel.centerXAnchor.constraint(equalTo: heightLabel.centerXAnchor).isActive = true
        heightDataLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor).isActive = true
        //height label
        
        */
        
        let weightDataLabel = UILabel()
        view.addSubview(weightDataLabel)
        
        if result.count == 0 {
            weightDataLabel.text = "nil"
        } else {
            weightDataLabel.text = String(describing: result[result.count-1]["targetWeight"]!) + "kg"
        }
        
        weightDataLabel.font = UIFont(name: weightDataLabel.font.fontName, size: 14)
        weightDataLabel.textAlignment = NSTextAlignment.center
        weightDataLabel.translatesAutoresizingMaskIntoConstraints = false
        weightDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        weightDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        weightDataLabel.centerXAnchor.constraint(equalTo: weightLabel.centerXAnchor).isActive = true
        weightDataLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor).isActive = true
        //weight label
        
        
        /*
        let ratioDataLabel = UILabel()
        view.addSubview(ratioDataLabel)
        ratioDataLabel.text = "nil"
        ratioDataLabel.font = UIFont(name: ratioDataLabel.font.fontName, size: 14)
        ratioDataLabel.textAlignment = NSTextAlignment.center
        ratioDataLabel.translatesAutoresizingMaskIntoConstraints = false
        ratioDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ratioDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratioDataLabel.centerXAnchor.constraint(equalTo: ratioLabel.centerXAnchor).isActive = true
        ratioDataLabel.topAnchor.constraint(equalTo: ratioLabel.bottomAnchor).isActive = true
        //ratio label
        
        
        
        
        let bmiDataLabel = UILabel()
        view.addSubview(bmiDataLabel)
        bmiDataLabel.text = "nil"
        bmiDataLabel.font = UIFont(name: bmiDataLabel.font.fontName, size: 14)
        bmiDataLabel.textAlignment = NSTextAlignment.center
        bmiDataLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiDataLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        bmiDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        bmiDataLabel.centerXAnchor.constraint(equalTo: bmiLabel.centerXAnchor).isActive = true
        bmiDataLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor).isActive = true
        //bmi label
        */
    }
    
    
    func setupButtons(){
        let bt_checkOut: UIButton = {
            let button = UIButton(type: UIButtonType.system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = defaultColor
            button.setTitle("Check Out", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.addTarget(nil, action: #selector(handle_checkOut), for: .touchUpInside)
            
            
            return button
        }()
    
        view.addSubview(bt_checkOut)
        bt_checkOut.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 100).isActive = true
        bt_checkOut.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -6).isActive = true
        bt_checkOut.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        bt_checkOut.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
        
        let bt_goBack: UIButton = {
            let button = UIButton(type: UIButtonType.system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = defaultColor
            button.setTitle("Go back", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.addTarget(nil, action: #selector(goBack), for: .touchUpInside)
            
            
            return button
        }()
        
        view.addSubview(bt_goBack)

        bt_goBack.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 100).isActive = true
        bt_goBack.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 6).isActive = true
        bt_goBack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        
        bt_goBack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }


    func handle_checkOut(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let successView = storyboard.instantiateViewController(withIdentifier: "checkOutSuccess")
        
        let failureView = storyboard.instantiateViewController(withIdentifier: "checkOutFailure")
        
        if fitness_progress == 100 && daysRemaining! <= 3 { // if success show success view
            navigationController?.show(successView, sender: nil)
        } else {    //if fails
            navigationController?.show(failureView, sender: nil)
        }
        
    }

    
    func goBack(){
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    
}


























