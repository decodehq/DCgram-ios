//
//  FeedRootVM.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class FeedRootVM: FeedRootVMProtocol {
    
    var numberOfItems: Int {
        return 40
    }
    func title(for index: Int) -> String {
        return "Asasas"
    }
    
    func image(for index: Int) -> UIImage {
        return ImageAssets.profilePlaceholderImage!
    }
}
