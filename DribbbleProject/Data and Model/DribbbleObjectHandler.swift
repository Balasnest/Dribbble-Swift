//
//  DribbbleObjectHandler.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit

class DribbbleObjectHandler: NSObject {
    
    class func getShots(_ url: String, callback:@escaping (([Shot]) -> Void)){
        var shots = [Shot]()
        let url = url+"&access_token="+Config.ACCESS_TOKEN
        
        HttpService.getJSON(url) { (jsonData) -> Void in
            
            for data in jsonData {
                let shot = Shot(data: data as! NSDictionary)
                shots.append(shot)
            }
            
            DispatchQueue.main.async {
                callback(shots)
            }
        }
    }
}
