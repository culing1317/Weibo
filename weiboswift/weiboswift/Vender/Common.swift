//
//  Common.swift
//  weiboswift
//
//  Created by 邹乾玲 on 2017/11/24.
//  Copyright © 2017年 touchair. All rights reserved.
//

import Foundation

let app_key = "247742152"
let app_secret = "fae5d9cbdaf51e84aa711e53a0bac44e"
let credict_url = "https://github.com/culing1317/Weibo"

let oAuth_url = "https://api.weibo.com/oauth2/authorize?client_id=" + app_key + "&amp;response_type=code&redirect_uri=" + credict_url

let userShow_url = "https://api.weibo.com/2/users/show.json"

let homeStatuses_url = "https://api.weibo.com/2/statuses/home_timeline.json"
