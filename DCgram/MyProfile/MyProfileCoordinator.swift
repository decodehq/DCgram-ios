//
//  MyProfileCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class MyProfileCoordinator: Coordinator {
    let rootNC: UINavigationController
    
    init(rootNavigationController: UINavigationController) {
        
        rootNC = rootNavigationController
        
        super.init(rootViewController: rootNavigationController)
    }
    
    override func start() {
        let photosGalleryVM = PhotosGalleryVM()
        let userInfoVM = UserCardVM()
        
        let vm = MyProfileRootVM(galleryViewModel: photosGalleryVM, infoViewModel: userInfoVM)
        let vc = MyProfileRootVC(viewModel: vm)
        
        rootNC.pushViewController(vc, animated: false)
    }
    
}
