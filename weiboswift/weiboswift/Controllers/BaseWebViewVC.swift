//
//  BaseWebViewVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/18.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class BaseWebViewVC: UIViewController {
    var urlStr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webVieW = UIWebView.init(frame: view.bounds)
        view.addSubview(webVieW)
        webVieW.loadRequest(URLRequest.init(url: (URL.init(string: urlStr))!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
