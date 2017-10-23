//
//  progressCircle.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 3/2/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class progressCircle: UIView {
    
    var circleLayer: CAShapeLayer!
    
    
    var multiplier: CGFloat = 1.0
    
    var centerOfCirclesView: CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    var halfOfViewSize: CGFloat{
        return min(bounds.size.height, bounds.size.width) / 2.2 * multiplier
    }
    
    var lineWidth:CGFloat = 5
    
    //circle radius
    
    var full:CGFloat = CGFloat(M_PI * 2)
    
    func drawCircleCenteredAt(_: CGPoint, radius: CGFloat, percentage: Float) -> UIBezierPath{
        
        let angle:CGFloat = CGFloat((percentage / 100) * Float(M_PI * 2))
        
        let circlePath = UIBezierPath(arcCenter: centerOfCirclesView,
                         radius: halfOfViewSize,
                         startAngle: (full * 3 / 4),
                         endAngle: angle + (full * 3 / 4),
                         clockwise: true)
        circlePath.lineWidth = lineWidth
        return circlePath
    }
    
    
    override func draw(_ rect: CGRect) {
        UIColor.lightGray.set()
        drawCircleCenteredAt(centerOfCirclesView, radius: halfOfViewSize, percentage: 100).stroke()
        UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1).set()
        drawCircleCenteredAt(centerOfCirclesView, radius: halfOfViewSize, percentage: fitness_progress).stroke()
        
        
        
        
        
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        .set
        .stroke
    }
    */

}




