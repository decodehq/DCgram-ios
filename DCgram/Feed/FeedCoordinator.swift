//
//  FeedCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class FeedCoordinator: Coordinator {
    let rootNC: UINavigationController
    
    init(rootNavigationController: UINavigationController) {
        
        rootNC = rootNavigationController
        
        super.init(rootViewController: rootNavigationController)
    }
}
