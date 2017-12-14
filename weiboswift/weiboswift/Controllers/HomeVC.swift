//
//  HomeVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/10/19.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
import SVProgressHUD
class HomeVC: BaseVC {
    let titleBtn = TitleBtn()
    lazy var statuseArr = Array<Status>()
    private lazy var popoverAnimator = PopoverAnimator { (prsented) in
        self.titleBtn.isSelected = prsented
    }
    private lazy var popVC = PopoverVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 200
        //1.没有登陆时设置的内容
        visitorView.addRotationAnimate()
        if !DiskTool.isLogin {
            return
        }
        //2.设置导航栏的内容
        setupNavigationBar()
        titleBtn.setTitle(DiskTool.getAccount()?.name, for: .normal)
        requestData()
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
            popoverAnimator.presentFrame = CGRect(x: view.frame.midX - view.frame.width * 0.25,
                                                  y: (navigationController?.navigationBar.frame.maxY)!,
                                                  width: view.frame.width * 0.5,
                                                  height: view.frame.size.height*0.4)
            
            present(popVC, animated: true, completion: nil)
        }else{
            popVC .dismiss(animated: true, completion: nil)
        }

        
    }
}

extension HomeVC {
    func requestData() {
        let access_token = DiskTool.getAccount()?.access_token!
        let parameters = ["access_token": access_token, "count": 8] as [String : Any?]
        NetworkTool.shareInstance.request(methodType: .GET, urlStr: homeStatuses_url, parameters: parameters) { (result: Any?, error: Error?) in
            if (error != nil) {
               SVProgressHUD.show(withStatus: error?.localizedDescription)
                return;
            }
            guard let statuses: [String : Any] = result as? [String : AnyObject] else {
                return
            }
            let array: Array<[String: AnyObject]> = statuses["statuses"] as! Array<Dictionary>
            for dict: [String: AnyObject] in array {
                let status = Status(dict: dict)
                self.statuseArr.append(status)
            }
            self.tableView.reloadData()
            print(self.statuseArr)
        }
    }
}

extension HomeVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuseArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StatusCell = tableView.dequeueReusableCell(withIdentifier: "status_cell") as! StatusCell
        cell.status = statuseArr[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

