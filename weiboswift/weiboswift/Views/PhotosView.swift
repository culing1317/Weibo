//
//  PhotosView.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/14.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
import SDWebImage
class PhotosView: UIView {
    var height: CGFloat = 0.0 {
        didSet {
            self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: height)
        }
    }
    
    var photo_urls: Array<String> = []{
        didSet {
            //列数
            if photo_urls.count == 0 {
                height = 0;
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
                imageV.tag = i;
                let tapG = UITapGestureRecognizer(target: self, action:#selector(tap(recognizer:)))
                imageV.addGestureRecognizer(tapG)
                imageV.isUserInteractionEnabled = true
            }
            height = CGFloat(((photo_urls.count-1)/3 + 1)) * (margin + widthH) - margin
        }
    }
    
}

extension PhotosView {
    @objc func tap(recognizer: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: ShowPhotoBrowserNote, object: self, userInfo: [ShowPhotoBrowserUrlsKey: self.photo_urls, ShowPhotoBrowserIndexKey: recognizer.view!.tag])
    }
}

extension PhotosView: AnimatorPresentedDelegate {
    func startRect(index: Int) -> CGRect {
        let imageView = viewWithTag(index) as! UIImageView
        let startRect = convert(imageView.frame, to: UIApplication.shared.keyWindow!)
        return startRect
    }
    
    func endRect(index: Int) -> CGRect {
        let picURL = photo_urls[index]
        let image = (SDWebImageManager.shared().imageCache.imageFromDiskCache(forKey: picURL))!
        
        let w = UIScreen.main.bounds.width
        let h = w / image.size.width * image.size.height
        var y : CGFloat = 0
        if h > UIScreen.main.bounds.height {
            y = 0
        } else {
            y = (UIScreen.main.bounds.height - h) * 0.5
        }
        
        return CGRect(x: 0, y: y, width: w, height: h)
        
    }
    
    func imageView(index: Int) -> UIImageView {
        let imageView = UIImageView()
        let picurl_str = photo_urls[index]
        let image = (SDWebImageManager.shared().imageCache.imageFromDiskCache(forKey: picurl_str))!
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }
    
    
}
