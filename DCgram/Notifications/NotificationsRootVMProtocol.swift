//
//  NotificationsRootVMProtocol.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

protocol NotificationsRootVMProtocol {
    
    var reloadItems: (() -> ())? {get set}
    
    var numberOfItems: Int { get }
    var currentIndex: Int {get}
    func title(for index: Int) -> String
    func image(for index: Int) -> UIImage
    
    func selectItem(at index: Int)
}
