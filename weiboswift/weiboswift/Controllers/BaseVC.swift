//
//  BaseVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/10/19.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class BaseVC: UITableViewController {
    lazy var visitorView = VistorView.visitorView()
    override func loadView() {
       let islogin = false
        islogin ? super.loadView() : setupVistorView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.registerBtn.addTarget(self, action: #selector(registerBtnClicked), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        // Do any additional setup after loading the view.
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
        
    }
}
