//
//  PhotosView.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/14.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class PhotosView: UIView {
    var height: CGFloat = 0.0
    
    var photo_urls: Array<String> = []{
        didSet {
            //列数
            if photo_urls.count == 0 {
                return
            }
            var column: Int = 0
            //行数
            var row: Int = 0
            let margin: CGFloat = 10.0
            let widthH: CGFloat = (self.frame.width - 2 * margin) / 3
            
            for i in 0..<photo_urls.count {
                column = i%3
                row = i/3
                let imageV = UIImageView(frame: CGRect(x: CGFloat(column) * (margin + widthH), y: CGFloat(row) * (margin + widthH), width: widthH, height: widthH))
                self.addSubview(imageV)
                let url = URL.init(string: photo_urls[i])
                imageV.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "empty_picture"))
            }
            height = CGFloat(((photo_urls.count-1)/3 + 1)) * (margin + widthH) - margin
        }
    }
    
}
