//
//  Utils.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit

open class Utils{
    
    open class func getStringFromJSON (_ data:  NSDictionary, key: String) -> String {
        
        if let info = data[key] as? String {
            return info
        }
        
        return ""
    }

}
