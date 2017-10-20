//
//  VistorView.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/10/19.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class VistorView: UIView {
    
   class func visitorView() -> VistorView {
        return Bundle.main.loadNibNamed("VistorView", owner: nil, options: nil)?.first as! VistorView
    }
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var rotationView: UIImageView!
    
    func setupVistorViewInfo(iconName : String, title : String) {
        iconView.image = UIImage(named: iconName)
        tipLabel.text = title
        rotationView.isHidden = true
    }
    
    func addRotationAnimate() {
        //1.创建动画
        let rotationAnimate = CABasicAnimation(keyPath: "transform.rotation.z")
        //2.设置动画的属性
        rotationAnimate.fromValue = 0
        rotationAnimate.toValue = Double.pi * 2
        rotationAnimate.repeatCount = MAXFLOAT
        rotationAnimate.duration = 4
        rotationAnimate.isRemovedOnCompletion = false
        //3.将动画添加到layer中
        rotationView.layer.add(rotationAnimate, forKey: nil)
        
        
    }
}
