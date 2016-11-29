//
//  NotAuthenticatedCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 24/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import SnapKit
import GoogleSignIn

class NotAuthenticatedCoordinator: Coordinator {
    
    private var signInVC = SignInVC()
    
    override func start() {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        rootViewController.dc_attachChildVC(signInVC)
                
        GIDSignIn.sharedInstance().uiDelegate = signInVC
        
        signInVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
       
    }
}

extension NotAuthenticatedCoordinator: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
}

extension NotAuthenticatedCoordinator: GIDSignInUIDelegate {
    
}
