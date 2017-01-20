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
        
        mainView.followersButton.addTarget(self, action: #selector(UserCardVC.followersButtonPressed), for: .touchUpInside)
        mainView.followedButton.addTarget(self, action: #selector(UserCardVC.followedButtonPressed), for: .touchUpInside)
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        mainView.nameLabel.text = viewModel.name
        mainView.aboutLabel.text = viewModel.about

        mainView.profileImage = viewModel.profileImage

        mainView.followersCountLabel.text = viewModel.followersCount
        mainView.followedCountLabel.text = viewModel.followedCount
    }
    
    @objc private func followersButtonPressed(sender: UIButton) {
        debugPrint("followers pressed")
    }
    
    @objc private func followedButtonPressed(sender: UIButton) {
        debugPrint("followed pressed")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
