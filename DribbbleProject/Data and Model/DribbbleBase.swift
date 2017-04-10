//
//  DribbbleBase.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit

class DribbbleBase: NSObject {
    var id: Int
    
    init(data: NSDictionary) {
        self.id = data["id"] as! Int
    }

}
