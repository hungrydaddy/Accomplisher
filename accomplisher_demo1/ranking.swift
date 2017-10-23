//
//  ranking.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 27/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class ranking: UIViewController, UITableViewDelegate, UITableViewDataSource {


    lazy var rankingTable: UITableView = {
        let view = UITableView()
        view.rowHeight = 60
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        view.allowsSelection = false
        
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setup()
        // Do any additional setup after loading the view.
    }

    
    func setup() {
        
        title = "Ranking"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        setupMenuButton()
        setuoRankingTable()
    }
    
    
    func setupMenuButton() {
        let bt = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(openMenu))
        bt.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = bt
        
    
    }

    
    func openMenu() {
        revealViewController().revealToggle(animated: true)
    }
    
    
    
    //tableview delegation below
    func setuoRankingTable() {
        view.addSubview(rankingTable)
        
        rankingTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rankingTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        rankingTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rankingTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rankingCell()
        cell.userName.text = "user\(indexPath.row)"
        cell.rankLabel.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rankingTable.deselectRow(at: indexPath, animated: false)
    }
    
    
}
