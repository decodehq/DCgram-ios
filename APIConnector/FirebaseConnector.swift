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
