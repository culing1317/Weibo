//
//  PresentationC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/3.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class PresentationC: UIPresentationController {
    
    var presentFrame : CGRect = CGRect.zero
    
    override func containerViewWillLayoutSubviews() {
        
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = presentFrame
        let maskView = UIView(frame: containerView!.bounds)
        maskView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        let tap = UITapGestureRecognizer(target: self, action: #selector(maskViewClick))
        maskView .addGestureRecognizer(tap)
        containerView?.insertSubview(maskView, at: 0)
        
    }
}

extension PresentationC {
    @objc private func maskViewClick(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
