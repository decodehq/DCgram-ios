//
//  AuthenticationProtocol.swift
//  DCgram
//
//  Created by Ante Baus on 29/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

public protocol AuthenticationProtocol {
    func signIn(googleIDToken: String, googleAccessToken: String, completion: ((NSError?) -> ())?)
}
