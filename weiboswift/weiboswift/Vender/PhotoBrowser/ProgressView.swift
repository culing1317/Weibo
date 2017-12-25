//
//  ProgressView.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/20.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    var progress: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        let radius = rect.width * 0.5 - 3
        let startAngle = CGFloat(-M_PI_2)
        let endAngle = CGFloat(2 * M_PI) * progress + startAngle
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: center)
        path.close()
        UIColor(white: 1.0, alpha: 0.4).setFill()
        path.fill()
    }

}
