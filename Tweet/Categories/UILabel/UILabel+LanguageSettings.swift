//
//  UILabel+LanguageSettings.swift
//  Tweet
//
//  Created by Fady on 12/24/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import UIKit

extension UILabel {
    
    func decideTextAlignment() {
        let deviceLanguage = Locale.preferredLanguages[0]
        
        if (deviceLanguage == "en") {
            self.textAlignment = .left
        } else {
            self.textAlignment = .right
        }
    }
}
