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
    var expires_in: TimeInterval?
    var uid: String?
    
    var profile_image_url: String?
    var avatar_large: String?
    var name: String?
    
    init(dict: Dictionary<String, Any>) {
        super.init()
        self.access_token = dict["access_token"] as? String
        self.expires_in = dict["expires_in"] as? TimeInterval
        self.uid = dict["uid"] as? String
        self.profile_image_url = dict["profile_image_url"] as? String
        self.avatar_large = dict["avatar_large"] as? String
        self.name = dict["name"] as? String
//        self.setValuesForKeys(dict)
       
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        self.expires_in = aDecoder.decodeObject(forKey: "expires_in") as? TimeInterval
        self.uid = aDecoder.decodeObject(forKey: "uid") as? String
        self.profile_image_url = aDecoder.decodeObject(forKey: "profile_image_url") as? String
        self.avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(profile_image_url, forKey: "profile_image_url")
        aCoder.encode(avatar_large, forKey: "avatar_large")
        aCoder.encode(name, forKey: "name")
    }

}

