//
//  SignInVMProtocol.swift
//  DCgram
//
//  Created by Ante Baus on 29/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import  Foundation
protocol SignInVMProtocol {
    func signIn (googleIDToken:String, googleAccessToken: String, completion: ((NSError?) -> ())?)
}
