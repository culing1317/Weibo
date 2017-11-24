//
//  TitleBtn.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/2.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class TitleBtn: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named:"navigationbar_arrow_down"), for: .normal)
        setImage(UIImage(named:"navigationbar_arrow_up"), for: .selected)
        setTitleColor(.black, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width + 8
    }

}
