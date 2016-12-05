//
//  SignInVC.swift
//  DCgram
//
//  Created by Ante Baus on 29/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInVC: UIViewController {
    
    fileprivate let viewModel: SignInVMProtocol
    
    init(viewModel: SignInVMProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SignInView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
}

extension SignInVC: GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        if presentedViewController == viewController {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension SignInVC: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error == nil) {
            viewModel.signIn(googleIDToken: user.authentication.idToken, googleAccessToken: user.authentication.accessToken, completion: nil)
        } else {
            debugPrint("\(error.localizedDescription)")
        }
    }
}
