//
//  ShotCollectionViewController.swift
//  DribbbleProject
//
//  Created by Sumit Ghosh on 03/04/17.
//  Copyright © 2017 com.bala.cc. All rights reserved.
//

import UIKit


private let reuseIdentifier_Shot = "ShotCollectionViewCell"

class ShotCollectionViewController: UICollectionViewController {
    
    fileprivate var shots:[Shot] = [Shot](){
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    fileprivate var cellWidth: CGFloat = 0.0
    fileprivate var cellHeight: CGFloat = 0.0
    
    fileprivate let cellVerticalMargin:CGFloat = 20.0
    fileprivate let cellHorizontalMargin:CGFloat = 20.0
    
    var API_URL = Config.SHOT_URL
    var shotPages = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    func loadShots() {
        self.collectionView!.backgroundColor = UIColor.hexStr("f5f5f5", alpha: 1.0)
        
        cellWidth = self.view.bounds.width
        cellHeight = self.view.bounds.height / 2.5
        
        // Register cell classes
        self.collectionView?.register(UINib(nibName: reuseIdentifier_Shot, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier_Shot)
        
        DribbbleObjectHandler.getShots(API_URL, callback:{(shots)->Void in
            self.shots = shots
        })
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ShotCollectionViewController.refreshInvoked(_:)), for: UIControlEvents.valueChanged)
        
    }
    
    func refreshInvoked(_ sender:AnyObject){
        sender.beginRefreshing()
        collectionView?.reloadData()
        sender.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier_Shot, for: indexPath) as! ShotCollectionViewCell
    
        // Configure the cell
        let shot = shots[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: shot.imageUrl))
        
        cell.designerIcon.sd_setImage(with: URL(string: shot.avatarUrl))
        cell.designerIcon.layer.cornerRadius = cell.designerIcon.bounds.width/2
        cell.designerIcon.layer.masksToBounds = true
        
        cell.shotName.text = shot.shotName
        cell.designerName.text = shot.designerName
        cell.viewUnitLabel.text = String(shot.shotCount)
        
        // Increase data Response
        if self.shots.count - 1 == indexPath.row && shotPages < 5 {
            shotPages += 1
            DribbbleObjectHandler.getShots(API_URL, callback:{(shots)->Void in
                for shot in shots {
                    self.shots.append(shot)
                }
            })
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth - cellHorizontalMargin, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellVerticalMargin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let _ = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier_Shot, for: indexPath) as! ShotCollectionViewCell
        
        let shot = shots[indexPath.row]
        
        let imageVC = ImageModalViewController(nibName:"ImageModalViewController", bundle:nil)
        imageVC.modalPresentationStyle = .fullScreen
        imageVC.modalTransitionStyle = .crossDissolve
        
        imageVC.pageUrl = shot.htmlUrl
        imageVC.shotName = shot.shotName
        imageVC.designerName = shot.designerName
        
        
//        imageVC.imageView.sd_setImage(with: URL(string: shot.imageUrl))
    
        let downloadQueue = DispatchQueue(label: "com.bala.processdownload", attributes: [])
        downloadQueue.async{
            let data = try? Data(contentsOf: URL(string: shot.imageUrl)!)
            
            var image: UIImage?
            
            if data != nil {
                shot.imageData = data
                image = UIImage(data: data!)!
            }
            
            DispatchQueue.main.async{
                imageVC.imageView.image = image
            }
        }
        parent?.present(imageVC, animated: true, completion: nil)
    }
}
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
 

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
*/
