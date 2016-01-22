//
//  VideosViewControllerExtension.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit
import AVKit
import Alamofire

extension VideosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDataSource Methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.videos.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: VideosCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(VideosCollectionViewCell.identifier, forIndexPath: indexPath) as! VideosCollectionViewCell
        
        let youtubeSearchResult = self.videos[indexPath.row]
        let video = youtubeSearchResult.video
        cell.setup(video)

        return cell
    }
    
    // MARK: UICollectionViewDelegate Methods
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let youtubeSearchResult = self.videos[indexPath.row]
        let playerVC = VideoPlayer()
        playerVC.video = youtubeSearchResult.video
        playerVC.playVideo()
        [self.presentViewController(playerVC, animated: true, completion: nil)]
    }
    
    //Created by Nazim Amin
    /*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let width: CGFloat = 1920 / 4
    let height: CGFloat = width / 16 * 9;
    return CGSizeMake(width, height)
    }*/
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        let defaultSize = CGSizeMake(400, 234)
        let focusSize = CGSizeMake(400 + (400 * 0.01), 234 + (234 * 0.01))
        if let prev = context.previouslyFocusedView as? VideosCollectionViewCell {
            UIView.animateWithDuration(0.2, animations: {
                    () -> Void in
                        prev.videoImageView.frame.size = defaultSize
                        prev.videoDescriptionLabel.textColor = UIColor.blackColor()
                })
        }
        if let next = context.nextFocusedView as? VideosCollectionViewCell {
            UIView.animateWithDuration(0.2, animations: {
                () -> Void in
                next.videoImageView.frame.size = focusSize
                next.videoDescriptionLabel.textColor = UIColor.purpleColor()
            })
        }
    }

}
