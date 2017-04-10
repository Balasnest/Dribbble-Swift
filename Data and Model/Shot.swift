//
//  Shot.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit

class Shot: DribbbleBase {
    var imageUrl:String!
    var htmlUrl:String!
    var imageData: Data!
    
    var shotName = ""
    var designerName = ""
    var avatarUrl = ""
    var shotCount = 0
    
    override init(data: NSDictionary) {
        super.init(data: data)
        let images = data["images"] as! NSDictionary
        self.imageUrl = Utils.getStringFromJSON(images, key: "normal")
        self.htmlUrl = data["html_url"] as! String
        
        shotName = data["title"] as! String
        let user = data["user"] as! NSDictionary
        designerName = Utils.getStringFromJSON(user, key: "name")
        avatarUrl = Utils.getStringFromJSON(user, key: "avatar_url")
        shotCount = data["views_count"] as! Int
        
    }

}
