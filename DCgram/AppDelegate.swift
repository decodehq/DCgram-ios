//
//  AppDelegate.swift
//  DCgram
//
//  Created by Vladimir Kolbas on 11/23/16.
//  Copyright © 2016 Vladimir Kolbas. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var rootCoordinator: RootCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        let api = FirebaseConnector()
        Business.configure(api: api)
        
        if Application.firstRun {
            AuthenticationService.signOut(completion: nil)
            Application.firstRun = false
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        rootCoordinator = RootCoordinator(window: window!)
        rootCoordinator.start()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {        
        return GIDSignIn.sharedInstance().handle(
            url,
            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
}
