//
//  MyProfileRootVM.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class MyProfileRootVM: MyProfileRootVMProtocol {

    var galleryVM: PhotosGalleryVMProtocol
    var infoVM: UserCardVMProtocol
    
    init(galleryViewModel: PhotosGalleryVMProtocol, infoViewModel: UserCardVMProtocol) {
        galleryVM = galleryViewModel
        infoVM = infoViewModel
    }
}
