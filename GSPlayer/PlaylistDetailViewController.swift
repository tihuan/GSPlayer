//
//  PlaylistDetailViewController.swift
//  GSPlayer
//
//  Created by Timmy Huang on 5/9/15.
//  Copyright (c) 2015 Timmy Huang. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {
    
    var playlist: Playlist?
    @IBOutlet weak var playlistCoverImage: UIImageView!
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var playlistDescription: UILabel!
    
    @IBOutlet weak var playlistArtist0: UILabel!
    @IBOutlet weak var playlistArtist1: UILabel!
    @IBOutlet weak var playlistArtist2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if playlist != nil {
            
            playlistCoverImage.image = playlist!.largeIcon
            playlistCoverImage.backgroundColor = playlist!.backgroundColor
            
            playlistTitle.text = playlist!.title
            playlistDescription.text = playlist!.description
            
            playlistArtist0.text = playlist!.artists[0]
            playlistArtist1.text = playlist!.artists[1]
            playlistArtist2.text = playlist!.artists[2]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playVideoSegue" {
            let videoViewController = segue.destinationViewController as! VideoViewController
            videoViewController.playlist = playlist
        }
    }
    
    @IBAction func playVideo(sender: AnyObject) {
        performSegueWithIdentifier("playVideoSegue", sender: sender)
    }
}
