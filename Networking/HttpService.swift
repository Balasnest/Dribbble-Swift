//
//  HttpService.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit

class HttpService: NSObject {
    class func getJSON(_ url: String, callback: @escaping ((NSArray) -> Void) ) {
        let nsURL = URL(string: url)!
        let session = URLSession.shared
        let task = session.dataTask(with: nsURL, completionHandler:{data, response, error -> Void in
            
            if error != nil {
                print("error")
            }
            
            if data != nil {
                let jsonData = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSArray
                callback(jsonData)
            }
            
            session.invalidateAndCancel()
        })
        
        task.resume()
    }
}
