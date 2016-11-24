//
//  UIImageViewExtension.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/16/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIImageView {

    public func imageFromUrl(_ URL: Foundation.URL) {
        let request = URLRequest(url: URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let imageData = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let imageData = data {
                DispatchQueue.main.async(execute: { () -> Void in
                    self.image = UIImage(data: imageData)
                })
            }
        })
        imageData.resume()
    }

}
