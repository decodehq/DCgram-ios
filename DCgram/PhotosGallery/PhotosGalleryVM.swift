//
//  PhotosGalleryVM.swift
//  DCgram
//
//  Created by Toni on 19/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class PhotosGalleryVM: PhotosGalleryVMProtocol {
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
