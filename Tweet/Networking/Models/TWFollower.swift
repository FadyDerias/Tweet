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
        try backgroundImageUrl = map.from("profile_banner_url")
        try hasBackgroundImage = map.from("profile_use_background_image")
    }
    
    //MARK: NSCoding
    
    //Encoding/Caching user object properties via the keys stored in the NSCodingKeys struct.
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyNSCodingKeys.name)
        aCoder.encode(id, forKey: PropertyNSCodingKeys.id)
        aCoder.encode(handle, forKey: PropertyNSCodingKeys.handle)
        aCoder.encode(bio, forKey: PropertyNSCodingKeys.bio)
        aCoder.encode(profileImageUrl, forKey: PropertyNSCodingKeys.profileImageUrl)
        aCoder.encode(backgroundImageUrl, forKey: PropertyNSCodingKeys.backgroundImageUrl)
        aCoder.encode(hasBackgroundImage, forKey: PropertyNSCodingKeys.hasBackgroundImage)
    }
    
    //Decoding user object properties via the the keys stored in the NSCodingKeys struct.
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let unarchivedName = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.name) as? String,
            let unarchivedId = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.id) as? String,
            let unarchivedHandle = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.handle) as? String,
            let unarchivedBio = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.bio) as? String,
            let unarchivedProfileImageUrl = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.profileImageUrl) as? String,
            let unarchivedBackgroundImageUrl = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.backgroundImageUrl) as? String
            else {
                return nil
        }
        
        let unarchivedHasBackgroundImage = aDecoder.decodeBool(forKey: PropertyNSCodingKeys.hasBackgroundImage)
        
        self.init(name: unarchivedName, id: unarchivedId, handle: unarchivedHandle, bio: unarchivedBio, profileImageUrl: unarchivedProfileImageUrl, backgroundImageUrl: unarchivedBackgroundImageUrl, hasBackgroundImage: unarchivedHasBackgroundImage)
    }
}
