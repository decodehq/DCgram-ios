//
//  AuthenticatedCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 24/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit
import DCKit

class AuthenticatedCoordinator: Coordinator {
    private let rootTabBarController = UITabBarController()
    
    override func start() {
        rootViewController.dc_attachChildVC(rootTabBarController)
    }
}
