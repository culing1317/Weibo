//
//  weiboswiftTests.swift
//  weiboswiftTests
//
//  Created by 邹乾玲 on 2017/10/16.
//  Copyright © 2017年 touchair. All rights reserved.
//

import XCTest
@testable import weiboswift

class weiboswiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
//        testAccountSetKeyValues()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testAccountSetKeyValues() {
//        let dict = ["access_token":"233", "expires_in": 1, "remind_in": 1, "isRealName": true, "uid": 45] as [String : Any]
////        let dict = ["access_token":"233","expires_in": 1] as [String : Any]
//        var account = Account.init(dict: dict)
//        print(account.description)
//    }
//    
//    func testRegularExpression() throws{
//        let str = "主角兔  秋冬款牛反绒兔毛雪地靴  券后59，这个价比双十二更便宜！能增高显瘦\n领券&下单：http://t.cn/RTSWU60" as NSString
//        let pattern = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?"
//        let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
//        let result = regex.matches(in: str as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: str.length))
//        if result.count > 0 {
//            for i in 0..<result.count {
//                let url = result[i]
//                print(url.range)
//                print(url)
//            }
//            
//        }
//    }
    
}
