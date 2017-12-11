//
//  WelcomeVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/11.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
import SDWebImage
class WelcomeVC: UIViewController {

    @IBOutlet weak var lblbottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var avatarIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarIV.layer.cornerRadius = avatarIV.frame.size.height * 0.5
        avatarIV.clipsToBounds = true
        let avatarStr: String = DiskTool.getAccount()?.profile_image_url ?? ""
        let avatarUrl: URL? = URL.init(string: avatarStr)
        lblbottomConstraint.constant = UIScreen.main.bounds.size.height * 0.5
        avatarIV.sd_setImage(with: avatarUrl, placeholderImage: UIImage(named: "avatar_default_big"))
        UIView.animate(withDuration: 3.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 5.0, options: [], animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
