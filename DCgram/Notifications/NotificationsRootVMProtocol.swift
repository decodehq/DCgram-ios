//
//  NotificationsRootVMProtocol.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

protocol NotificationsRootVMProtocol {
    
    var numberOfItems: Int { get }
    func title(for index: Int) -> String
    func image(for index: Int) -> UIImage
}
