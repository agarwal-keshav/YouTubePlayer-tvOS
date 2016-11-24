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
        if (videoURL != nil) {
            player = AVPlayer(url: videoURL! as URL)
            player?.play()
        }
        
    }
    
}
