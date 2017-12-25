//
//  PhotoBrowserCell.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/20.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
import SDWebImage
protocol PhotoBrowserCellDelegate {
    func imageViewClick()
}

class PhotoBrowserCell: UICollectionViewCell {
    var picURL: URL? {
        didSet {
            setupContent(picURL: picURL)
        }
    }
    var delegate: PhotoBrowserCellDelegate?
    
    lazy var scrollView: UIScrollView = UIScrollView()
    lazy var progressView: ProgressView = ProgressView()
    lazy var imageView:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

extension PhotoBrowserCell {
    func setupUI() {
        contentView.addSubview(scrollView)
        contentView.addSubview(progressView)
        contentView.addSubview(imageView)
        
        scrollView.frame = contentView.bounds
        scrollView.frame.size.width -= 20
        progressView.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        progressView.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.5)
        progressView.isHidden = true
        progressView.backgroundColor = UIColor.clear
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(imageViewClick))
        imageView.addGestureRecognizer(tapGes)
        imageView.isUserInteractionEnabled = true
    }
    func setupContent(picURL: URL?) {
        guard let picURL = picURL else {
            return
        }
        let image = SDWebImageManager.shared().imageCache.imageFromMemoryCache(forKey: picURL.absoluteString)
        guard let imageI = image else {
            return
        }
        let width = UIScreen.main.bounds.width
        let height = width / (imageI.size.width) * (imageI.size.height)
        var y: CGFloat = 0
        if height > UIScreen.main.bounds.height {
            y = 0;
        } else {
            y = (UIScreen.main.bounds.height - height) * 0.5
        }
        imageView.frame = CGRect(x: 0, y: y, width: width, height: height)
        progressView.isHidden = false
        imageView.sd_setImage(with: getBigURL(smallURL: picURL), placeholderImage: image, options: [], progress: { (current, total) in
            self.progressView.progress = CGFloat(current) / CGFloat(total)
        }) { (_, _, _, _) in
            self.progressView.isHidden = true
        }
        
        scrollView.contentSize = CGSize(width: 0, height: height)
    }
    
    private func getBigURL(smallURL: URL) -> URL {
        let smallURLString = smallURL.absoluteString
        let bigURLString = smallURLString.replacingOccurrences(of: "thumbnail", with: "bmiddle")
        return URL(string: bigURLString)!
    }
    
}

extension PhotoBrowserCell {
    @objc private func imageViewClick() {
        delegate?.imageViewClick()
    }
}
