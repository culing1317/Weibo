//
//  String+Extension.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/14.
//  Copyright © 2017年 touchair. All rights reserved.
//

import Foundation

extension String {
     func translateTime() -> String {
        
        let formatter = DateFormatter();
        formatter.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        let created_at_date = formatter.date(from: self)!
        let nowDate = Date()
        let interval = nowDate.timeIntervalSince(created_at_date)
        if interval < 60 {
            return "刚刚";
        }
        if interval < 60 * 60 {
            return "\((Int(interval) / 60))分钟前"
        }
        if interval < 60 * 60 * 24 {
            return "\(Int(interval) / (60*60))小时前"
        }
        //昨天数据
        let calender = Calendar.current
        if calender.isDateInYesterday(created_at_date) {
            formatter.dateFormat = "昨天 HH:mm"
            return formatter.string(from: created_at_date)
        }
        //一年之内的数据
        let cmp = calender.dateComponents([Calendar.Component.year], from: created_at_date, to: nowDate)
        if cmp.year! < 1 {
            formatter.dateFormat = "MM-dd HH:mm"
            return formatter.string(from: created_at_date)
        }
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: created_at_date)
        
    }
   
}
