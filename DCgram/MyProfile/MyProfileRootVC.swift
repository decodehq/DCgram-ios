//
//  MyProfileRootVC.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class MyProfileRootVC: UIViewController {
    private struct Constants {
        static let textNavBarTitle = NSLocalizedString("My Profile", comment: "Title for the navigation bar on My Profile screen where user can see his profile data.")
        static let userInfoViewHeightRatio = CGFloat(0.34)
    }
    
    private var galleryVC: PhotosGalleryVC
    private var userInfoVC: UserCardVC
    var viewModel: MyProfileRootVMProtocol
    
    init(viewModel: MyProfileRootVMProtocol) {
        self.viewModel = viewModel
        self.galleryVC = PhotosGalleryVC(viewModel: viewModel.galleryVM)
        self.userInfoVC = UserCardVC(viewModel: viewModel.infoVM)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = Constants.textNavBarTitle
        
        edgesForExtendedLayout = []
        
        dc_attachChildVC(galleryVC)
        dc_attachChildVC(userInfoVC)
        
        userInfoVC.mainView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(view).multipliedBy(Constants.userInfoViewHeightRatio)
        }
        
        galleryVC.mainView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(userInfoVC.mainView.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
