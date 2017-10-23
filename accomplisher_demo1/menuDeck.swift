//
//  menuDeck.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 4/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class menuDeck: UITableViewController {

    var menuItems = ["Home","productIntros","logOut"]
    
    override func viewDidLoad() {
        //nothing
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuItems[indexPath.row], for: indexPath) as UITableViewCell
        cell.textLabel?.text = menuItems[indexPath.row]
        
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = UIColor(red: 211/255, green: 57/255, blue: 57/255, alpha: 1)
        
        return cell
    }
    
    
}
