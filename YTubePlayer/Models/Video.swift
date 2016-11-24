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
    var URL: Foundation.URL?
    let name: String
    let thumbnailURL: Foundation.URL
    let largeThumbnailURL: Foundation.URL
    let description: String

    init(id: String, name: String, description: String, thumbnail: Foundation.URL, largeThumbnailURL: Foundation.URL) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnailURL = thumbnail
        self.largeThumbnailURL = largeThumbnailURL
    }

    func videoFormattedDescription() -> String {
        return self.name + "\n" + self.description
    }

    mutating func videoFormattedURL() -> Foundation.URL? {
        if self.URL == nil {
            let urlStr = "https://www.youtube.com/watch?v=\(self.id)"
            //let urlStr = "https://www.youtube.com/watch?v=pwb-yDYVRcE"
            self.URL = (Foundation.URL(string: urlStr))
        }
        let videosDict = HCYoutubeParser.h264videos(withYoutubeURL: self.URL)
        if let videoURL = videosDict?["medium"] as? String {
            return Foundation.URL(string: videoURL)!
        }

        return nil
    }

}
