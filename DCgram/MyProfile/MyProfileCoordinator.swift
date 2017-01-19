//
//  MyProfileCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class MyProfileCoordinator: Coordinator {
    let rootNC: UINavigationController
    
    init(rootNavigationController: UINavigationController) {
        
        rootNC = rootNavigationController
        
        super.init(rootViewController: rootNavigationController)
    }
    override func start() {
        let vm = MyProfileRootVM()
        let vc = MyProfileRootVC(viewModel: vm)
        rootNC.pushViewController(vc, animated: false)
    }
    
}
