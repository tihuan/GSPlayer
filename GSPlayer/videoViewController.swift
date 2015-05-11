//
//  videoViewController.swift
//  GSPlayer
//
//  Created by Timmy Huang on 5/10/15.
//  Copyright (c) 2015 Timmy Huang. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class VideoViewController: UIViewController {
    
    var moviePlayer:MPMoviePlayerController!
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if playlist != nil {
            var videoUrl: String = playlist!.url!
            println(videoUrl)
            var url:NSURL = NSURL(string: videoUrl)!
            
            moviePlayer = MPMoviePlayerController(contentURL: url)
            moviePlayer.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            
            self.view.addSubview(moviePlayer.view)
            moviePlayer.fullscreen = true
            
            moviePlayer.controlStyle = MPMovieControlStyle.Embedded

        }
    }
}
