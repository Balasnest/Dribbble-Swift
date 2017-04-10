//
//  BaseViewController.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//
import UIKit


class BaseViewController: UIViewController {
    
    var pageMenu: CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var controllerArray:[UIViewController] = []
        
        self.navigationItem.title = "Dashboard"
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.navigationBarTitleTextColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.navigationBarBackgroundColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        let popularShot = ShotCollectionViewController(nibName:"ShotCollectionViewController", bundle: nil)
        popularShot.title = "Popular"
        popularShot.API_URL = Config.POPULAR_URL
        popularShot.loadShots()
        controllerArray.append(popularShot)
        
        let gifShot = ShotCollectionViewController(nibName:"ShotCollectionViewController", bundle: nil)
        gifShot.title = "GIF"
        gifShot.API_URL = Config.GIF_URL
        gifShot.loadShots()
        controllerArray.append(gifShot)
        
        let teamShot = ShotCollectionViewController(nibName:"ShotCollectionViewController", bundle: nil)
        teamShot.title = "Teams"
        teamShot.API_URL = Config.TEAMS_URL
        teamShot.loadShots()
        controllerArray.append(teamShot)
        
        let reboundsShot = ShotCollectionViewController(nibName: "ShotCollectionViewController", bundle: nil)
        reboundsShot.title = "Rebounds"
        reboundsShot.API_URL = Config.REBOUNDS_URL
        reboundsShot.loadShots()
        controllerArray.append(reboundsShot)
        
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor.scrollMenuBackgroundColor()),
            .viewBackgroundColor(UIColor.viewBackgroundColor()),
            .selectionIndicatorColor(UIColor.selectionIndicatorColor()),
            .bottomMenuHairlineColor(UIColor.bottomMenuHairlineColor()),
            .selectedMenuItemLabelColor(UIColor.selectedMenuItemLabelColor()),
            .unselectedMenuItemLabelColor(UIColor.unselectedMenuItemLabelColor()),
            .selectionIndicatorHeight(2.0),
            .menuItemFont(UIFont(name: "HiraKakuProN-W6", size: 13.0)!),
            .menuHeight(34.0),
            .menuItemWidth(80.0),
            .menuMargin(0.0),
            .menuItemSeparatorRoundEdges(true),
            .centerMenuItems(true)
        ]
        
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)

        
        self.view.addSubview(pageMenu!.view)
        self.addChildViewController(pageMenu!)
        pageMenu?.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
