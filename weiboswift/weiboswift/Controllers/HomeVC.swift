//
//  HomeVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/10/19.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {
    let titleBtn = TitleBtn()
    private lazy var popoverAnimator = PopoverAnimator { (prsented) in
        self.titleBtn.isSelected = prsented
    }
    private lazy var popVC = PopoverVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.没有登陆时设置的内容
        visitorView.addRotationAnimate()
        if !DiskTool.isLogin {
            return
        }
        //2.设置导航栏的内容
        setupNavigationBar()
        titleBtn.setTitle(DiskTool.getAccount()?.name, for: .normal)
        
    }

}

extension HomeVC {
    private func setupNavigationBar() {
        //1.设置左侧的item
        let leftBtn = UIButton()
        leftBtn.setImage(UIImage(named:"navigationbar_friendattention"), for: .normal)
        leftBtn.setImage(UIImage(named:"navigationbar_friendattention_highlighted"), for: .highlighted)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        leftBtn.sizeToFit()
        //2.设置右边的item
        let rightBtn = UIButton();
        rightBtn.setImage(UIImage(named:"navigationbar_pop"), for: .normal)
        rightBtn.setImage(UIImage(named:"navigationbar_pop_highlighted"), for: .highlighted)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        //3.设置titleView
        titleBtn .setTitle("大栗子", for: .normal)
        titleBtn .addTarget(self, action:#selector(titleBtnDidClicked(btn:)), for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
    }
}

extension HomeVC {
    @objc func titleBtnDidClicked(btn: TitleBtn) {
        btn.isSelected = !btn.isSelected
        if btn.isSelected {
            popVC.modalPresentationStyle = .custom
            popVC.transitioningDelegate = popoverAnimator
            popoverAnimator.presentFrame = CGRect(x: view.frame.midX - view.frame.width * 0.25, y: (navigationController?.navigationBar.frame.maxY)!, width: view.frame.width * 0.5, height: view.frame.size.height*0.4)
            
            present(popVC, animated: true, completion: nil)
        }else{
            popVC .dismiss(animated: true, completion: nil)
        }

        
    }
}

