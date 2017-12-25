//
//  Statuse.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/14.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
@objcMembers
class Status: NSObject {
    var created_at: String!
//    @objc var id: u_long!
    var text: String?
//    var source_type: Int!
    var source: String!
    var pic_urls = Array<[String: String]>() {
        didSet {
            for dict in pic_urls{
                pic_urlsArr.append(dict["thumbnail_pic"]!)
            }
        }
    }
    var reposts_count: Int = 0
    var comments_count: Int = 0
    var attitudes_count: Int = 0
    var user: User!
    var retweeted_status: Status?
    var pic_urlsArr = Array<String>()
    
    override init() {
        super.init()
    }
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
//        source_type = dict["source_type"] as! Int
        reposts_count = dict["reposts_count"] as! Int
        comments_count = dict["comments_count"] as! Int
        attitudes_count = dict["attitudes_count"] as! Int
        if let userDict:[String: Any] = dict["user"] as? [String: Any] {
            user = User(dict: userDict)
        }
        if let retweeted_statusDict:[String: Any] = dict["retweeted_status"] as? [String: Any] {
           retweeted_status = Status(dict: retweeted_statusDict)
        }
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
