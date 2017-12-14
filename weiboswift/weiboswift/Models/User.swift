//
//  User.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/14.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
@objcMembers
class User: NSObject {
    var id: Int!
//    
//    /// 用户等级
//    var rank: Int!
    
    /// 用户昵称
    var screen_name: String!
    
    /// 180x180
    var avatar_large: String?
    
    /// 50x50
    var profile_image_url: String?
    
    /// hd
    var avatar_hd: String?
    
    
    /// 用户认证图片
    var verifiedImage: UIImage?
    
    /// 用户等级图片
    var vipImage: UIImage?
    /// 认证类型 
    var verified_type: Int = -1 {
        didSet {
            switch verified_type {
            case 0:
                verifiedImage = #imageLiteral(resourceName: "avatar_vip")
            case 2,3,5:
                verifiedImage = #imageLiteral(resourceName: "avatar_enterprise_vip")
            case 220:
                verifiedImage = #imageLiteral(resourceName: "avatar_grassroot")
            default:
                verifiedImage = nil
            }
        }
    }
    
    /// 用户认证等级
//    var verified_level: Int = 0
    var mbrank: Int = 0 {
        didSet {
            if mbrank > 0 && mbrank <= 6 {
                vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
        id = dict["id"] as! Int
        verified_type = dict["verified_type"] as! Int
        mbrank = dict["mbrank"] as! Int
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
