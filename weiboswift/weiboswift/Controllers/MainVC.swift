//
//  MainVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/10/19.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    /// lazy load
    private lazy var composeBtn: UIButton = UIButton(nImageName: "tabbar_compose_icon_add", hlImageName: "tabbar_compose_icon_add_highlighted", bgImageName: "tabbar_compose_button", bghlImageName: "tabbar_compose_button_highlighted")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupComposeBtn()
    }
    

}

// MARK: - setup UI
extension MainVC {
    
    ///setupComposeBtn
    private func setupComposeBtn() {
        tabBar .addSubview(composeBtn)
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        composeBtn.addTarget(self, action: #selector(MainVC.ComposeBtnClicked), for: .touchUpInside)
    }
    
}

// MARK: - click methods
/*
 事件监听的本质是发送消息
 将方法包装成@ —-> SEL类中查找方法列表 --> 根据@SEL找到imp指针 --> 执行函数
 在swift中，如果将一个函数声明成private，该函数将不会放到函数列表中
 如果在private前面加上@objc，该函数则会被放到函数列表中
 */
extension MainVC {
    @objc private func ComposeBtnClicked() {
        let composeVC = ComposeVC()
        let navVC = UINavigationController(rootViewController: composeVC)
        present(navVC, animated: true, completion: nil)
    }

}
