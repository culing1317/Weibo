//
//  AccessToken.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/27.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

/// setValuesForKeys,需声明@objcMembers

/// u_long、bool类型，在setValuesForKeys都会报错
@objcMembers
class Account: NSObject,NSCoding {
    var access_token: String?
    
    /// 过期时间
    var expires_in: NSNumber?
    var isRealName: NSNumber?
    var uid: NSNumber?
    var expires_date: NSDate?
    
    var profile_image_url: String?
    var avatar_large: String?
    var name: String?
    
    init(dict: Dictionary<String, Any>) {
        super.init()
        self.setValuesForKeys(dict)
       
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        aDecoder.decodeObject(forKey: "access_token")
        aDecoder.decodeDouble(forKey: "expires_in")
        aDecoder.decodeDouble(forKey: "isRealName")
        aDecoder.decodeDouble(forKey: "uid")
        aDecoder.decodeDouble(forKey: "profile_image_url")
        aDecoder.decodeDouble(forKey: "avatar_large")
        aDecoder.decodeDouble(forKey: "name")
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode("access_token")
        aCoder.encode("expires_in")
        aCoder.encode("isRealName")
        aCoder.encode("uid")
        aCoder.encode("profile_image_url")
        aCoder.encode("avatar_large")
        aCoder.encode("name")
    }

}

