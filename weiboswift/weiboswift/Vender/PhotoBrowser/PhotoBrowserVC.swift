//
//  PhotoBrowserVC.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/20.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit
import SVProgressHUD
private let PhotoBrowserCellID = "PhotoBrowserCellID"
class PhotoBrowserVC: UIViewController {
    lazy var closeBtn = UIButton(bgColor: UIColor.darkGray, titleColor: UIColor.white, fontSize: 14.0, title: "关闭")
    lazy var saveBtn = UIButton(bgColor: UIColor.darkGray, titleColor: UIColor.white, fontSize: 14.0, title: "保存")
    lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: PhotoBrowserLayout())
    var currentIndex: Int = 0
    var picURLs = [URL]()
    
    init(index: Int, urls: [URL]) {
        super.init(nibName: nil, bundle: nil)
        currentIndex = index
        picURLs = urls
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func loadView() {
        super.loadView()
        view.frame.size.width += 20
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        closeBtn.frame = CGRect(x: 30, y: view.frame.height - 30 - 40, width: 60, height: 30)
        saveBtn.frame = CGRect(x: view.frame.width - 50 - 30, y: view.frame.height - 30 - 40, width: 60, height: 30)
    }

}

extension PhotoBrowserVC {
    func setupUI() {
        collectionView.frame = view.bounds
        view.addSubview(closeBtn)
        view.addSubview(saveBtn)
        closeBtn.addTarget(self, action: #selector(close), for: .touchUpInside)
        saveBtn.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
}

extension PhotoBrowserVC {
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    @objc func save() {
        print("save")
        let cell = collectionView.visibleCells.first as! PhotoBrowserCell
        guard let image = cell.imageView.image else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    @objc private func image(image : UIImage, didFinishSavingWithError error : NSError?, contextInfo : AnyObject) {
        var showInfo = ""
        if error != nil {
            showInfo = "保存失败"
        } else {
            showInfo = "保存成功"
        }
        
        SVProgressHUD.show(withStatus: showInfo)
    }
}

extension PhotoBrowserVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoBrowserCellID, for: indexPath) as! PhotoBrowserCell
        cell.picURL = picURLs[indexPath.item]
        cell.delegate = self
        return cell
    }
}

extension PhotoBrowserVC: PhotoBrowserCellDelegate {
    func imageViewClick() {
        close()
    }
    
    
}

extension PhotoBrowserVC: AnimatorDismissDelegate {
    func indexForDismissView() -> Int {
        let cell = collectionView.visibleCells.first
        let i = collectionView.indexPath(for: cell!)?.row
        return i!
    }
    
    func imageViewForDismissView() -> UIImageView {
        let imageView = UIImageView()
        let cell = collectionView.visibleCells.first as! PhotoBrowserCell
        imageView.frame = cell.imageView.frame
        imageView.image = cell.imageView.image
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    
}

class PhotoBrowserLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = collectionView!.frame.size
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .horizontal
        
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
    }
    
}
