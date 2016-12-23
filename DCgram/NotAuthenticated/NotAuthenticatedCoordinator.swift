//
//  NotAuthenticatedCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 24/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import SnapKit

class NotAuthenticatedCoordinator: Coordinator {
    
    
    fileprivate let signInVC: SignInVC
    fileprivate let signInVM: SignInVM
    
    override init(rootViewController: UIViewController) {
        let authService = AuthenticationService()
        signInVM = SignInVM(authService: authService)
        
        signInVC = SignInVC(viewModel: signInVM)
        
        super.init(rootViewController: rootViewController)
        
        signInVM.onSignInComplete = { [weak self] success, messageError in
            if success {
                self?.onEnding?()
            } else {
                //TODO: Show Error!
            }
        }
    }
    
    override func start() {        
        rootViewController.dc_attachChildVC(signInVC)
        
        signInVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    deinit {
        signInVC.dc_detachVCFromParentVC()
    }
}
