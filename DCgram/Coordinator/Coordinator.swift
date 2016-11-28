//
//  Coordinator.swift
//  DCgram
//
//  Created by Ante Baus on 24/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit
import Foundation

class Coordinator: NSObject {
    
    let rootViewController: UIViewController
    
    private(set) var childCoordinators: [Coordinator]
    
    var onEnding: (() -> Void)?
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.childCoordinators = []
    }
    
    func addChildCoordinator(childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(childCoordinator: Coordinator) {
        
        if let index = childCoordinators.index(of: childCoordinator) {
            childCoordinators.remove(at: index)
        } else {
            fatalError("Trying to remove not existing child coordinator")
        }
    }
    
    func start() {
        
    }
}
