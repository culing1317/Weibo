//
//  NetworkTool.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/23.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
import AFNetworking


/// 请求类型
///
/// - GET:
/// - POST:
enum RequestType : String {
    case GET = "GET"
    case POST = "POST"
}
class NetworkTool: AFHTTPSessionManager {
    // let 是线程安全的
    static let shareInstance : NetworkTool = { () -> NetworkTool in
        let tool = NetworkTool()
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    
}

extension NetworkTool {
    
    
    func request(methodType : RequestType, urlStr : String, parameters : Any?,
                 finished : @escaping (_ result : Any?, _ error : Error?) -> ()) {
        let successCallBack = { (task : URLSessionDataTask, result : Any?) -> Void in
            finished(result, nil)
            }
        
        let failureCallBack = { (task : URLSessionDataTask?, error : Error) -> Void in
            finished(nil, error)
        }
        
        
        if methodType == .GET {
            get(urlStr, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
            
        } else {
//
//            post(urlStr, parameters: parameters, progress: nil, success: { (task : URLSessionDataTask?, result : Any?) in
//
//                print(result!)
//
//            } , failure: { (task : URLSessionDataTask?, error : NSError) in
//                    print(error)
//                    } as? (URLSessionDataTask?, Error) -> Void)
            post(urlStr, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
            
        }
    }

}
