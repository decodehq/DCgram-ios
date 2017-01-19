//
//  MyProfileRootVM.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class MyProfileRootVM: MyProfileRootVMProtocol {
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getNumberOfItemsInSection() -> Int {
        return 20
    }
    
    func getImage(for item: Int) -> UIImage? {
        return ImageAssets.cameraTabBarITem
    }
}
