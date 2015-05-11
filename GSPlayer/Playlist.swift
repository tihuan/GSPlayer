//
//  Playlist.swift
//  GSPlayer
//
//  Created by Timmy Huang on 5/10/15.
//  Copyright (c) 2015 Timmy Huang. All rights reserved.
//

import Foundation
import UIKit

struct Playlist {
    var title: String?
    var description: String?
    var url: String?
    var icon: UIImage?
    var largeIcon: UIImage?
    var artists: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    init(index: Int) {
        let musicLibrary = MusicLibrary().library
        let playlistDictionary = musicLibrary[index]
        let iconName = playlistDictionary["icon"] as! String
        let largeIconName = playlistDictionary["largeIcon"] as! String
        let colorsDictionary = playlistDictionary["backgroundColor"] as! [String: CGFloat]
        
        title = playlistDictionary["title"] as! String!
        description = playlistDictionary["description"] as! String!
        url = playlistDictionary["url"] as! String!
        icon = UIImage(named: iconName)
        largeIcon = UIImage(named: largeIconName)
        artists += playlistDictionary["artists"] as! [String]
        backgroundColor = rgbColorFromDictionary(colorsDictionary)

    }
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/225.0, blue: blue/225.0, alpha: alpha)
    }
}