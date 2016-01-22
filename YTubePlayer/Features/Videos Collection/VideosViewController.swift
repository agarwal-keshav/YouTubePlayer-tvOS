//
//  VideosViewController.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit
import Alamofire

class VideosViewController: UIViewController {

    @IBOutlet weak var videosCollectionView: UICollectionView!

    let videosURL = "https://yplayer.firebaseio.com/items.json"
    var videos = Array<YouTubeSearchResult>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, self.videosURL, parameters: nil)
            .responseJSON { result in
                let JSON: NSDictionary = result.result.value as! NSDictionary
                let items = JSON["items"] as! NSDictionary
                for (_, item) in items {
                    let youtubeSearchItem = YouTubeSearchResult(jsonDict: item["id"] as! NSDictionary)
                    self.videos.append(youtubeSearchItem)
                }
                self.videosCollectionView.reloadData()
        }
    }

}

