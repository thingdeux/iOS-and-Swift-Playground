//
//  Collections.swift
//  Joker
//
//  Created by Josh on 1/1/16.
//  Copyright © 2016 Josh.Land. All rights reserved.
//

import Foundation

extension Array {
    // Mostly unnecessary but stretching my knowledge of extensions
    // Allows getRandomELement to any array
    func getRandomElement() -> Generator.Element? {
        guard self.count > 0  else {
            return nil
        }
        
        let itemCount: Int = self.count.hashValue
        let randLocation = Int(arc4random()) % (itemCount) + 0
        return self[randLocation]
    }
}