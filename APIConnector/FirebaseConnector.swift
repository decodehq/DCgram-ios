//
//  FirebaseConnector.swift
//  DCgram
//
//  Created by Ante Baus on 30/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import Foundation
import Firebase

public class FirebaseConnector: NSObject, APIProtocol {
    
}

extension FirebaseConnector: AuthenticationProtocol {
    public var signedIn: Bool {
        get {            
            return FIRAuth.auth()?.currentUser != nil
        }
    }
    
    public func signOut(completion: ((NSError?) -> ())?) {
        do {
            try FIRAuth.auth()?.signOut()
            completion?(nil)
        } catch let signOutError as NSError {
            completion?(signOutError)
        }
    }
    
    public func signIn(googleIDToken: String, googleAccessToken: String, completion: ((NSError?) -> ())?) {
        
        let credential = FIRGoogleAuthProvider.credential(
            withIDToken: googleIDToken,
            accessToken: googleAccessToken
        )
        
        FIRAuth.auth()!.signIn(with: credential, completion: { (user, error) in
            completion?(error as NSError?)
        } as FIRAuthResultCallback)
    }
}
