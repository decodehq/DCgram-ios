//
//  SignInVC.swift
//  DCgram
//
//  Created by Ante Baus on 29/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInVC: UIViewController, GIDSignInUIDelegate {
    override func loadView() {
        self.view = SignInView()
    }
}
