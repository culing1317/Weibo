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
        testAccountSetKeyValues()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAccountSetKeyValues() {
        // ["access_token":"233", "expires_in": 1, "remind_in": 1, "isRealName": true, "uid": 45]
        let dict = ["access_token":"233","expires_in": 1] as [String : Any]
        var account = Account.init(dict: dict)
        print(account.description)
    }
    
}
