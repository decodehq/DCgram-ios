//
//  AuthenticationService.swift
//  DCgram
//
//  Created by Ante Baus on 30/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
// 

public class AuthenticationService {
    static var authenticator: AuthenticationProtocol!
    
    public func signIn(googleIDToken: String, googleAccessToken: String, completion: ((NSError?) -> ())?) {
        AuthenticationService.authenticator.signIn(googleIDToken: googleIDToken, googleAccessToken: googleAccessToken, completion: completion)
    }
}
