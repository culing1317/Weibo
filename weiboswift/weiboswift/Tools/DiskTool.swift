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
    static let path =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/account.data"
    
    
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
        
        let account: Account? = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! Account?
        return account
        
    }
}
