//
//  NotificationsRootVM.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class NotificationsRootVM: NotificationsRootVMProtocol {
        
    var numberOfItems: Int {
        return 40
    }    
    func title(for index: Int) -> String {
        return "Amber vašu fotografiju označuje sa \"svidja mi se\""
    }
    
    func image(for index: Int) -> UIImage {
        return ImageAssets.profilePlaceholderImage!
    }
}
