//
//  NotificationsCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class NotificationsCoordinator: Coordinator {
    let rootNC: UINavigationController
    
    init(rootNavigationController: UINavigationController) {
        
        rootNC = rootNavigationController
        
        super.init(rootViewController: rootNavigationController)
    }
    
    override func start() {
        let vm = NotificationsRootVM()
        let vc = NotificationsRootVC(viewModel: vm)
        rootNC.pushViewController(vc, animated: true)
    }
    
}
