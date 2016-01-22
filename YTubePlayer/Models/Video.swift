//
//  Video.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

struct Video {

    let id: String
    var URL: NSURL?
    let name: String
    let thumbnailURL: NSURL
    let largeThumbnailURL: NSURL
    let description: String

    init(id: String, name: String, description: String, thumbnail: NSURL, largeThumbnailURL: NSURL) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnailURL = thumbnail
        self.largeThumbnailURL = largeThumbnailURL
    }

    func videoFormattedDescription() -> String {
        return self.name + "\n" + self.description
    }

    mutating func videoFormattedURL() -> NSURL? {
        if self.URL == nil {
            let urlStr = "https://www.youtube.com/watch?v=\(self.id)"
            //let urlStr = "https://www.youtube.com/watch?v=pwb-yDYVRcE"
            self.URL = (NSURL(string: urlStr))
        }
        let videosDict = HCYoutubeParser.h264videosWithYoutubeURL(self.URL)
        if let videoURL = videosDict["medium"] as? String {
            return NSURL(string: videoURL)!
        }

        return nil
    }

}
