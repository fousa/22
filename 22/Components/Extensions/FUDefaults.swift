//
//  FUDefaults.swift
//
//  Created by Jelle Vandenbeeck on 29/09/15.
//  Copyright © 2015. All rights reserved.
//

import Foundation

class FUDefaults: NSUserDefaults {
    
    private static let FUDefaultsBirthdateKey = "FUDefaultsBirthdateKey"
    
    // MARK: - Overrides
    
    static var birthdate: NSDate? {
        get {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.synchronize()
            return defaults.objectForKey(FUDefaultsBirthdateKey) as? NSDate
        }
        set {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(newValue, forKey: FUDefaultsBirthdateKey)
            defaults.synchronize()
        }
    }
}