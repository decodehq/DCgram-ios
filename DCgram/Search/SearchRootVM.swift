//
//  SearchRootVM.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class SearchRootVM: SearchRootVMProtocol {
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getNumberOfItemsInSection() -> Int {
        return 20
    }
    
    func updateResults() {
        
    }
    
    func getImage(for item: Int) -> UIImage? {
        return ImageAssets.cameraTabBarITem
    }
}
