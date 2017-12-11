//
//  BaseVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/10/19.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class BaseVC: UITableViewController {
    
    /// 未登陆／访客 视图
    lazy var visitorView = VistorView.visitorView()
 
    
    override func loadView() {
        
        DiskTool.isLogin ? super.loadView() : setupVistorView()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        visitorView.registerBtn.addTarget(self, action: #selector(registerBtnClicked), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

extension BaseVC {
    @objc private func setupVistorView() {
        view = visitorView
    }
}

extension BaseVC {
    @objc private func registerBtnClicked() {
        print("registerBtnClicked")
    }
    @objc private func loginBtnClicked() {
        
        let oauthVC = OAuthVC()
        self .present(UINavigationController(rootViewController: oauthVC), animated: true, completion: nil)
        
    }
}
