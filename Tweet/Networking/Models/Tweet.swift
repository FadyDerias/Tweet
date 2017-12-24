//
//  Tweet.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import Foundation
import Mapper

class Tweet: NSObject, Mappable  {
    
    var fullText: String
    
    //JSON Parsing via Mapper POD
    required init(map: Mapper) throws {
        try fullText = map.from("full_text")
    }
}
