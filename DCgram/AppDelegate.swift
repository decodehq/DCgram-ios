//
//  AppDelegate.swift
//  DCgram
//
//  Created by Vladimir Kolbas on 11/23/16.
//  Copyright © 2016 Vladimir Kolbas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var rootCoordinator: RootCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        rootCoordinator = RootCoordinator(window: window!)
        rootCoordinator.start()
        
        return true
    }
}

