//
//  TWFollower.swift
//  Tweet
//
//  Created by Fady on 12/23/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import Foundation
import Mapper

class TWFollower : NSObject, NSCoding, Mappable {
    
    var name: String
    var id: String
    var handle : String
    var bio: String
    var profileImageUrl: String
    var backgroundImageUrl: String
    var hasBackgroundImage: Bool
    
    //struct that contains keys to store the user object properties to the user defaults.
    struct PropertyNSCodingKeys {
        static let name = "name"
        static let id = "id"
        static let handle = "handle"
        static let bio = "bio"
        static let profileImageUrl = "profileImageUrl"
        static let backgroundImageUrl = "backgroundImageUrl"
        static let hasBackgroundImage = "hasBackgroundImage"
    }
    
    init(name: String, id: String, handle: String, bio: String, profileImageUrl: String, backgroundImageUrl: String, hasBackgroundImage: Bool) {
        self.name = name
        self.id = id
        self.handle = handle
        self.bio = bio
        self.profileImageUrl = profileImageUrl
        self.backgroundImageUrl = backgroundImageUrl
        self.hasBackgroundImage = hasBackgroundImage
    }
    
    //JSON Parsing via Mapper POD
    required init(map: Mapper) throws {
        try name = map.from("name")
        try id = map.from("id_str")
        try handle = map.from("screen_name")
        try bio = map.from("description")
        try profileImageUrl = map.from("profile_image_url_https")
        try backgroundImageUrl = map.from("profile_background_image_url_https")
        try hasBackgroundImage = map.from("profile_use_background_image")
    }
    
    }
}
