//
//  String+Extension.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/14.
//  Copyright © 2017年 touchair. All rights reserved.
//

import Foundation
import UIKit
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

extension String {
    func height(font: UIFont, maxWidth: CGFloat) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return size.height
    }
}


//extension String {
//    func replaceUrl()->(NSAttributedString) {
//        var str = "主角兔  秋冬款牛反绒兔毛雪地靴  券后59，这个价比双十二更便宜！能增高显瘦\n领券&下单：http://t.cn/RTSWU60"
//        let pattern = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?" as NSString
//        do {
//            let regex = try NSRegularExpression(pattern: pattern as String, options: .caseInsensitive)
//            let result = regex.matches(in: str as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: str.length))
//            if result.count > 0 {
//                for i in 0..<result.count {
//                    let url = result[i]
//                    print(url.range)
//
//                }
//
//
//            }
//        } catch {
//
//        }
//
//    }
//}

