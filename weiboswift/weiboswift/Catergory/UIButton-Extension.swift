//
//  UIButton-Extension.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/10/19.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(nImageName : String,hlImageName : String,  bgImageName : String, bghlImageName : String) {
        self.init()
        setImage(UIImage(named:nImageName), for: UIControlState.normal)
        setImage(UIImage(named:hlImageName), for: UIControlState.highlighted)
        setBackgroundImage(UIImage(named:bgImageName), for: UIControlState.normal)
        setBackgroundImage(UIImage(named:bghlImageName), for: UIControlState.highlighted)
        sizeToFit()
    }
    convenience init(bgColor: UIColor, titleColor: UIColor, fontSize: CGFloat, title: String) {
        self.init()
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
        backgroundColor = bgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
}
