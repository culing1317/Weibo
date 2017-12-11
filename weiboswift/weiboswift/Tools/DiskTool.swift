//
//  DiskTool.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/29.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class DiskTool: NSObject {
    
    /// 用户信息沙盒路径
    static let path =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/account.plist"
    static var isLogin: Bool {
        
        get {
            let account = self.getAccount()
            guard (account != nil) else {
                return false
            }
            return true
        }
        
    }
    
    
}

extension DiskTool {
    
    /// 保存用户信息
    ///
    ///
    static func saveAccount(account: Account) {
        
        let result = NSKeyedArchiver.archiveRootObject(account, toFile: path)
        print("保存用户信息",result)
        
    }
    
    
    /// 获取用户信息
    ///
    ///
    static func getAccount() -> Account? {
        let data = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        
        let account: Account? = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? Account
        guard account != nil && account?.uid != nil else {
            return nil
        }
        //account不为空
        if let expiresDate: Date = Date.init(timeIntervalSinceNow: (account?.expires_in as? TimeInterval)!) {
            return (expiresDate.compare(Date()) == .orderedDescending ? account : nil)
        }
        return account
        
    }
}
