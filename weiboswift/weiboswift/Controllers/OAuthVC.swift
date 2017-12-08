//
//  OAuthVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/24.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class OAuthVC: UIViewController {

    ///webView
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        setupUI()
        loadPage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// MARK: - UI界面搭建
extension OAuthVC {
    
    private func setupUI() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "关闭", style: .plain, target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "填充", style: .plain, target: self, action: #selector(fill))
        
    }
    
    private func loadPage() {
        
        webView.load(URLRequest(url: URL.init(string: oAuth_url)!))
        
    }

    
}

// MARK: - 事件响应方法
extension OAuthVC {
    
    @objc private func close() {
        SVProgressHUD.dismiss()
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func fill() {
        
        let jsCode = "document.getElementById('userId').value='17315853723';document.getElementById('passwd').value='ss19940413';"
        
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }
        
    
}


// MARK: - 请求数据
extension OAuthVC {
    
    
    
}

extension OAuthVC: WKNavigationDelegate {
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        guard let url = navigationAction.request.url?.absoluteString else {
            
            
            return
        }
        if url.contains(credict_url+"?code=") {
            
            let strs = url.components(separatedBy: "code=")
            guard let code = strs.last else{
                return
            }
            print("code:"+code)
            NetworkTool.shareInstance.request(methodType: .POST,
                                              urlStr:
                "https://api.weibo.com/oauth2/access_token?client_id=" + app_key + "&client_secret=" + app_secret + "&grant_type=authorization_code&redirect_uri=" + credict_url + "&code=" + code,
                                              parameters: nil,
                                              finished: { (result: Any?, error: Error?) in
                                                
                                                if (error != nil) {
                                                    print("获取accesstoken失败")
                                                } else {
                                                    guard let dic: Dictionary = result as? Dictionary<String,Any> else{
                                                        print("没有获取到授权后的数据")
                                                        return
                                                    }
//
                                                    let account = Account.init(dict: dic)
                                                    self.loadUserInfo(account: account)

                                                }
                                                
            })
        }
    }

    private func loadUserInfo(account: Account) {
        guard (account.access_token != nil) else {
            return;
        }
        guard (account.uid != nil) else {
            return;
        }
        let parameters = ["access_token":account.access_token, "uid": account.uid] as [String : Any]
        NetworkTool.shareInstance.request(methodType: .GET, urlStr: userShow_url, parameters: parameters) { (result: Any?, error: Error?) in
            
            guard (error == nil) else {
                print(error!);
                return;
            }
            
            guard let dic = result as? Dictionary<String, Any> else {
                print("没有获取到用户信息")
                return
            }
            
            account.name = dic["name"] as? String
            account.profile_image_url = dic["profile_image_url"] as? String
            account.avatar_large = dic["avatar_large"] as? String
            DiskTool.saveAccount(account: account)
            self.close()
        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SVProgressHUD.show(withStatus: "正在加载中...")
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        SVProgressHUD.dismiss()

        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        SVProgressHUD.showError(withStatus: "授权网页加载失败")
        
    }

    
}

