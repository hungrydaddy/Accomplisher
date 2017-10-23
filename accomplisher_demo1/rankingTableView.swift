//
//  rankingTableView.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 4/4/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class rankingTableView: UITableView {
    
    

    override func numberOfRows(inSection section: Int) -> Int {
        return 6
    }
    
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        let cell = rankingCell()
        
        return cell
    }
    
    
}
