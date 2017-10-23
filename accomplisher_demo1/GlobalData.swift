//
//  GlobalDataViewController.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 3/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

var fitness_progress: Float = 0
var daysRemaining: Int?


let defaultColor:UIColor = UIColor(red: 219/255, green: 17/255, blue: 28/255, alpha: 1)
//fitness_progress is the percentage of the progress

struct target_t {
    var weight: Float!
    var ratio: Float!
    var date: Date!
    var bond: Int!
}

var user_target: target_t = target_t.init(weight: 100.0, ratio: 20.0, date: Date.init(), bond: 100)

struct previous_t {
    var weight: Float!
    var date: Date!
}

var user_previous: previous_t = previous_t.init()

var userName: String?
