//
//  PListHelper.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 17/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import Foundation

class PLIstHelper {
    
    static func getWebUrl(_ arrayIndex: Int) -> String {
        
        let webUrlPlist = Bundle.main.path(forResource: "WebData", ofType: "plist")
        let arrayOfWebUrls = NSArray(contentsOfFile: webUrlPlist!) as! Array<String>
        
        // in plist I put only 30 web pages for additional data, in other cases show main page of Star Wars on disney.wikia.com
        if arrayIndex < arrayOfWebUrls.count {
            return arrayOfWebUrls[arrayIndex]
        } else {
            return "http://disney.wikia.com/wiki/Star_Wars"
        }
        
    }
}
