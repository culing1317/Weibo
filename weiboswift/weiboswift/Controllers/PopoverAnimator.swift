//
//  PopoverAnimator.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/23.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {
    
    var isPresented = false
    var  presentFrame : CGRect = CGRect.zero
    var callBack : ((Bool) ->())?
    
    
    init(callBack: @escaping ((Bool) ->())) {
        self.callBack = callBack
    }
    
}

// MARK:- 自定义转场代理的方法
extension PopoverAnimator : UIViewControllerTransitioningDelegate {
    //   改变弹出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentation = PresentationC(presentedViewController: presented, presenting: presenting)
        presentation.presentFrame = presentFrame
        
        return presentation
    }
    
    //   自定义弹出的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        callBack!(isPresented)
        return self
    }
    //   自定义消失的动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        callBack!(isPresented)
        return self
    }
}


// MARK: - 弹出和消失动画代理
extension PopoverAnimator : UIViewControllerAnimatedTransitioning {
    
    /// 动画执行时间
    ///
    /// - Parameter transitionCon text: 转场上下文
    /// - Returns: 执行时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    /// 获取转场的上下文：可以通过转场的上下文获取弹出的View和消失的View
    //
    /// - Parameter transitionContext:
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPresentaionView(using: transitionContext) : animationForDismissView(using: transitionContext)
    }
    
    private func animationForPresentaionView(using transitionContext: UIViewControllerContextTransitioning) {
        //1.获取弹出的动画
        let presentedView = transitionContext.view(forKey: .to)!
        //2.将弹出的View添加到containerView中
        transitionContext.containerView.addSubview(presentedView)
        //3.执行动画
        presentedView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0)
        presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.transform = CGAffineTransform.identity
        }) { (_) in
            //  必须告诉转场上下文已经完成动画
            transitionContext.completeTransition(true)
        }
    }
    
    private func animationForDismissView(using transitionContext: UIViewControllerContextTransitioning) {
        
        /// 获取消失动画
        let dismissView = transitionContext.view(forKey: .from)!
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.001)
        }) { (_) in
            dismissView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
    
}
