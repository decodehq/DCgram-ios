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
//        static let kTextSearchPlaceholderTitle = NSLocalizedString("Search", comment: "Placeholder for the search text field, user can see it on search view")
    }
    
    var mainView: MyProfileRootView { return view as! MyProfileRootView } //swiftlint:disable:this force_cast
    var viewModel: MyProfileRootVMProtocol
        
    init(viewModel: MyProfileRootVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = MyProfileRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
