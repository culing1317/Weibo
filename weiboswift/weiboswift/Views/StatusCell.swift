//
//  StatusCell.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/12/14.
//  Copyright © 2017年 touchair. All rights reserved.
//

import UIKit

class StatusCell: UITableViewCell {

    @IBOutlet weak var photosView: PhotosView!
    @IBOutlet weak var avaterIV: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var vipIV: UIImageView!
    @IBOutlet weak var timeL: UILabel!
    @IBOutlet weak var sourceL: UILabel!
    @IBOutlet weak var textL: UILabel!
    @IBOutlet weak var repostBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var photosView_Height_Constarint: NSLayoutConstraint!
    @IBOutlet weak var retweetView_Height_Contraint: NSLayoutConstraint!
    var status:Status! {
        didSet {
            reloadCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avaterIV.layer.cornerRadius = avaterIV.frame.height * 0.5
        avaterIV.clipsToBounds = true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func retweet(_ sender: UIButton) {
        
    }
    
    @IBAction func comment(_ sender: UIButton) {
        
    }
    
    @IBAction func like(_ sender: UIButton) {
        
    }
    
}

extension StatusCell {
    func reloadCell() {
        
        avaterIV.sd_setImage(with: URL.init(string: status.user?.profile_image_url ?? ""), placeholderImage: #imageLiteral(resourceName: "avatar_default"))
        nameL.text = status.user?.screen_name;
        vipIV.image = status.user?.vipImage
        timeL.text = status.created_at.translateTime()
        sourceL.text = status.source.components(separatedBy: "\">").last?.components(separatedBy: "<").first
        textL.text = status.text
//        if status.retweeted_status == nil {
//            retweetView_Height_Contraint.constant = 0.1
//        }
        repostBtn.setTitle("\(status.reposts_count)", for: .normal)
        commentBtn.setTitle("\(status.comments_count)", for: .normal)
        likeBtn.setTitle("\(status.attitudes_count)", for: .normal)
        photosView.photo_urls = status.pic_urlsArr
        photosView_Height_Constarint.constant = photosView.height        
        layoutIfNeeded()
    }
    func clearView() {
        avaterIV.image = #imageLiteral(resourceName: "avatar_default")
        textL.text = nil
        sourceL.text = nil
        // todo: clear retweetview
        for view: UIView in photosView.subviews {
            view.removeFromSuperview()
        }
    }
}

extension StatusCell {

}
