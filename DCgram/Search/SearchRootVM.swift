//
//  SearchRootVM.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class SearchRootVM: SearchRootVMProtocol {
    func updateResults() {
        
    }
    
    var galleryVM: PhotosGalleryVMProtocol
    
    init(galleryViewModel: PhotosGalleryVMProtocol) {
        galleryVM = galleryViewModel
    }
}
