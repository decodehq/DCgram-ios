//
//  SignInVM.swift
//  DCgram
//
//  Created by Ante Baus on 29/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit

class SignInVM: SignInVMProtocol {
    
    var onSignInComplete: ((Bool, String?) -> ())?
    
    fileprivate let authService: AuthenticationService

    init(authService: AuthenticationService) {
        self.authService = authService
    }
    
    func signIn(googleIDToken: String, googleAccessToken: String, completion: ((NSError?) -> ())?) {
        authService.signIn(googleIDToken: googleIDToken, googleAccessToken: googleAccessToken, completion: { [weak self] (error) in
            
            self?.onSignInComplete?(error == nil, error?.localizedDescription)
        })
    }
}
