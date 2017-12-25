//
//  PhotoBrowserAnimator.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/20.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

protocol AnimatorPresentedDelegate: NSObjectProtocol {
    func startRect(index: Int) -> CGRect
    func endRect(index: Int) -> CGRect
    func imageView(index: Int) -> UIImageView
}

protocol AnimatorDismissDelegate: NSObjectProtocol {
    func indexForDismissView() -> Int
    func imageViewForDismissView() -> UIImageView
}

class PhotoBrowserAnimator: NSObject {
    var isPresented: Bool = false
    var presentedDelegate: AnimatorPresentedDelegate?
    var dismissDelegate: AnimatorDismissDelegate?
    var index: Int?
    
}

extension PhotoBrowserAnimator: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
}

extension PhotoBrowserAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    func animationForPresentedView(transistionContext: UIViewControllerContextTransitioning) {
        guard let pd = presentedDelegate, let selectedIndex = index else {
            return
        }
        //1.取出弹出的view
        let presentedView = transistionContext.view(forKey: .to)!
        //2.将presentedView添加到containerView中
        transistionContext.containerView.addSubview(presentedView)
        //3.获取执行动画的imageView
        let startRect = pd.startRect(index: selectedIndex)
        let imageView = pd.imageView(index: selectedIndex)
        transistionContext.containerView.addSubview((imageView))
        imageView.frame = startRect
        //3.执行动画
        presentedView.alpha = 0.0
        transistionContext.containerView.backgroundColor = UIColor.black
        UIView.animate(withDuration: transitionDuration(using: transistionContext), animations: {
            imageView.frame = (self.presentedDelegate?.endRect(index: selectedIndex))!
        }) { (_) in
            imageView.removeFromSuperview()
            presentedView.alpha = 1.0
            transistionContext.containerView.backgroundColor = UIColor.clear
            transistionContext.completeTransition(true)
        }
    }
    
    func animationForDismissView(transitionContext: UIViewControllerContextTransitioning) {
        guard let dl = dismissDelegate, let pd = presentedDelegate else {
            return
        }
        
        let dismissView = transitionContext.view(forKey: .from)
        dismissView?.removeFromSuperview()
        
        let imageView = dl.imageViewForDismissView()
        transitionContext.containerView.addSubview(imageView)
        let index = dl.indexForDismissView()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            imageView.frame = pd.startRect(index: index)
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
    }
    
}
