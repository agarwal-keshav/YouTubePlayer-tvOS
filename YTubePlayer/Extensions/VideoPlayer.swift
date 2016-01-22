//
//  VideoPlayer.swift
//  StarcraftWatch
//
//  Created by Nazim on 1/22/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class VideoPlayer: AVPlayerViewController, AVPlayerViewControllerDelegate {
    var video: Video?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playVideo() {
        let videoURL = self.video?.videoFormattedURL()
        let playerVC = AVPlayerViewController()
        if (videoURL != nil) {
            print(videoURL)
            let asset = AVAsset(URL: videoURL!)
            let playerItem = AVPlayerItem(asset: asset)
            playerVC.player = AVPlayer(playerItem: playerItem)
            playerVC.player?.play()
        }
        
    }
    
}
