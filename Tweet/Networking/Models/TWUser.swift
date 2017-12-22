//
//  TWUser.swift
//  Tweet
//
//  Created by Fady on 12/22/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import Foundation

class TWUser: NSObject, NSCoding {
    
    var name: String
    var id: String
    var authToken: String
    var authTokenSecret: String
    
    //struct that contains keys to store the user object properties to the user defaults.
    struct PropertyNSCodingKeys {
        static let name = "name"
        static let id = "id"
        static let authToken = "authToken"
        static let authTokenSecret = "authTokenSecret"
    }
    
    init(name: String, id: String, authToken: String, authTokenSecret: String) {
        self.name = name
        self.id = id
        self.authToken = authToken
        self.authTokenSecret = authTokenSecret
    }
    
    //Encoding/Caching user object properties via the keys stored in the NSCodingKeys struct.
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyNSCodingKeys.name)
        aCoder.encode(id, forKey: PropertyNSCodingKeys.id)
        aCoder.encode(authToken, forKey: PropertyNSCodingKeys.authToken)
        aCoder.encode(authTokenSecret, forKey: PropertyNSCodingKeys.authTokenSecret)
    }
    
    //Decoding user object properties via the the keys stored in the NSCodingKeys struct.
    required convenience init?(coder aDecoder: NSCoder) {
        guard let unarchivedName = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.name) as? String,
              let unarchivedId = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.id) as? String,
              let unarchivedAuthToken = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.authToken) as? String,
              let unarchivedAuthTokenSecret = aDecoder.decodeObject(forKey: PropertyNSCodingKeys.authTokenSecret) as? String
            else {
                return nil
        }
        
        self.init(name: unarchivedName, id: unarchivedId, authToken: unarchivedAuthToken, authTokenSecret: unarchivedAuthTokenSecret)
    }
}
