//
//  Config.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit

class Config: NSObject {
    static let ACCESS_TOKEN = "a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21"
    static let SHOT_URL = "https://api.dribbble.com/v1/shots"
    static let POPULAR_URL = SHOT_URL + "?sort="
    static let RECENT_URL = SHOT_URL + "?sort=recent"
    static let GIF_URL = SHOT_URL + "?sort=&list=animated?per_page=3"
    static let REBOUNDS_URL = SHOT_URL + "?sort=&list=rebounds"
    static let TEAMS_URL = SHOT_URL + "?sort=&list=teams"
}
