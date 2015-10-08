//
//  FUDefaults.swift
//
//  Created by Jelle Vandenbeeck on 29/09/15.
//  Copyright © 2015. All rights reserved.
//

import Foundation

class FUDefaults: NSUserDefaults {
    
    private static let FUDefaultsYearKey = "FUDefaultsYearKey"
    
    // MARK: - Overrides
    
    static var year: Int? {
        get {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.synchronize()
            let optionalYear = defaults.integerForKey(FUDefaultsYearKey)
            return optionalYear == 0 ? nil : optionalYear
        }
        set {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(newValue, forKey: FUDefaultsYearKey)
            defaults.synchronize()
        }
    }
}