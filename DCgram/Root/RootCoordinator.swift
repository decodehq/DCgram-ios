//
//  RootCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 24/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit

class RootCoordinator: Coordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        let rootVC = UIViewController()
        
        super.init(rootViewController: rootVC)
    }
    
    override func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        updateState()
    }
    
    private func updateState() {
        let authenticated = false //true //TODO: get this info from session manager
        
        if authenticated {
            let coordinator = AuthenticatedCoordinator(rootViewController: rootViewController)
            addChildCoordinator(childCoordinator: coordinator)
            
            unowned(unsafe) let coordinator_ = coordinator
            coordinator.onEnding = { [weak self] in
                self?.removeChildCoordinator(childCoordinator: coordinator_)
            }
            
            coordinator.start()
        } else {
            let coordinator = NotAuthenticatedCoordinator(rootViewController: rootViewController)
            addChildCoordinator(childCoordinator: coordinator)
            
            unowned(unsafe) let coordinator_ = coordinator
            coordinator.onEnding = { [weak self] in
                self?.removeChildCoordinator(childCoordinator: coordinator_)
            }
            
            coordinator.start()
        }
    }
}
