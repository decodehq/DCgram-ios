//
//  UserCardVC.swift
//  DCgram
//
//  Created by Toni on 20/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class UserCardVC: UIViewController {
    
    var mainView: UserCardView { return view as! UserCardView } //swiftlint:disable:this force_cast
    var viewModel: UserCardVMProtocol
    
    init(viewModel: UserCardVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = UserCardView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        mainView.nameLabel.text = "aaaasadadadadad"
        mainView.aboutLabel.text = "asadadadadsad"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
