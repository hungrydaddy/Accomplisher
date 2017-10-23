//
//  menu.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 1/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class menu: UIViewController {
    
    let profileView = userProfile()
    
    @IBOutlet weak var bt_ranking: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setup()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var bt_home: UIButton!
    
    @IBOutlet weak var bt_intro: UIButton!
    
    @IBOutlet weak var bt_logOut: UIButton!
    
    @IBAction func handle_logOut(_ sender: Any) {
        let loginView = LoginScreen()
        loginView.VC_menu = self
        present(loginView, animated: true, completion: nil)
        revealViewController().revealToggle(animated: true)
        //jump to login screen
    }

    func setup(){
        setupProfile()
        setupButtons()
    }

    func setupProfile(){
        view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        
        profileView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        profileView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        profileView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        
        
        
        profileView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handle_goToProfile))
        gesture.numberOfTapsRequired = 1
        profileView.addGestureRecognizer(gesture)
    }
    
    
    func setupButtons(){
        bt_home.translatesAutoresizingMaskIntoConstraints = false
        
        bt_home.backgroundColor = defaultColor
        bt_home.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_home.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        bt_home.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bt_home.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        bt_intro.translatesAutoresizingMaskIntoConstraints = false
        
        bt_intro.backgroundColor = defaultColor
        bt_intro.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_intro.topAnchor.constraint(equalTo: bt_home.bottomAnchor, constant: 24).isActive = true
        bt_intro.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bt_intro.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        bt_ranking.translatesAutoresizingMaskIntoConstraints = false
        
        bt_ranking.backgroundColor = defaultColor
        bt_ranking.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_ranking.topAnchor.constraint(equalTo: bt_intro.bottomAnchor, constant: 24).isActive = true
        bt_ranking.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bt_ranking.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        
        bt_logOut.translatesAutoresizingMaskIntoConstraints = false
        
        bt_logOut.backgroundColor = defaultColor
        bt_logOut.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bt_logOut.topAnchor.constraint(equalTo: bt_ranking.bottomAnchor, constant: 24).isActive = true
        bt_logOut.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bt_logOut.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    }
    
    
    func handle_goToProfile(){
        revealViewController().revealToggle(animated: true)
        let view = storyboard?.instantiateViewController(withIdentifier: "profileDetails")
        present(view!, animated: true, completion: nil)
    }
    
    
    
    
    func handleGoToRanking() {
        
        let nextVC = ranking()
        _ = SWRevealViewControllerSeguePushController(identifier: "pushFront", source: self, destination: nextVC)
        
        performSegue(withIdentifier: "pushFront", sender: nil)
    
    }

    
}
