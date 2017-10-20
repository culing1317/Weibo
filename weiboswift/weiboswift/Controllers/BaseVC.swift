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
        
        
        // Do any additional setup after loading the view.
    }


}

extension BaseVC {
    private func setupVistorView() {
        view = visitorView
    }
}
