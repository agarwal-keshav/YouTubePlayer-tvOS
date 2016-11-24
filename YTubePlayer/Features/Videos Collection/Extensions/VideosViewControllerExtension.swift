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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VideosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: VideosCollectionViewCell.identifier, for: indexPath) as! VideosCollectionViewCell
        
        let youtubeSearchResult = self.videos[(indexPath as NSIndexPath).row]
        let video = youtubeSearchResult.video
        cell.setup(video)

        return cell
    }
    
    // MARK: UICollectionViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let youtubeSearchResult = self.videos[(indexPath as NSIndexPath).row]
        let playerVC = VideoPlayer()
        playerVC.video = youtubeSearchResult.video
        playerVC.playVideo()
        [self.present(playerVC, animated: true, completion: nil)]
    }
    
    //Created by Nazim Amin
    /*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let width: CGFloat = 1920 / 4
    let height: CGFloat = width / 16 * 9;
    return CGSizeMake(width, height)
    }*/
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        let defaultSize = CGSize(width: 400, height: 234)
        let focusSize = CGSize(width: 400 + (400 * 0.01), height: 234 + (234 * 0.01))
        if let prev = context.previouslyFocusedView as? VideosCollectionViewCell {
            UIView.animate(withDuration: 0.2, animations: {
                    () -> Void in
                        prev.videoImageView.frame.size = defaultSize
                        prev.videoDescriptionLabel.textColor = UIColor.black
                })
        }
        if let next = context.nextFocusedView as? VideosCollectionViewCell {
            UIView.animate(withDuration: 0.2, animations: {
                () -> Void in
                next.videoImageView.frame.size = focusSize
                next.videoDescriptionLabel.textColor = UIColor.purple
            })
        }
    }

}
