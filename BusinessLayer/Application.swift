//
//  Application.swift
//  DCgram
//
//  Created by Ante Baus on 04/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation


private let kAppAlreadyLaunched = "app_already_launched"

class Application: NSObject {
    
    static var firstRun: Bool {
        get {
            return !UserDefaults.standard.bool(forKey: kAppAlreadyLaunched)
        }
        set{
            UserDefaults.standard.set(!newValue, forKey: kAppAlreadyLaunched)
            UserDefaults.standard.synchronize()
        }
    }
}
