//
//  UserCardView.swift
//  DCgram
//
//  Created by Toni on 20/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class UserCardView: UIView {
    private struct Constants {
        static let textFollowersLabelTitle = NSLocalizedString("Followers", comment: "Title for Followers text label on screen where user can see his profile data.")
        static let textFollowedLabelTitle = NSLocalizedString("Followed", comment: "Title for Followed text label on screen where user can see his profile data.")
        
        static let contentInset = UIEdgeInsets(top: 15, left: 16, bottom: 16, right: 16)
    }
    
    private(set) var followersCount: String?
    private(set) var followedCount: String?
    
    private(set) var followersButton: UIButton!
    private(set) var followedButton: UIButton!
    
    private(set) var nameLabel: UILabel!
    private(set) var aboutLabel: UILabel!
    
    private(set) var profileImage: UIImage? = {
        let image = ImageAssets.profilePlaceholderImage
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.backgroundWhiteColor
        
        let profileImageView = UIImageView()
        profileImageView.image = profileImage
        profileImageView.contentMode = .scaleAspectFill
        
        followersButton = UIButton()
        followersButton.titleLabel?.lineBreakMode = .byWordWrapping
        followersButton.setTitle("\(followersCount)\n\(Constants.textFollowersLabelTitle)", for: .normal)
        followersButton.setTitleColor(Color.titleBlackColor, for: .normal)
        followersButton.sizeToFit()
        
        followedButton = UIButton()
        followedButton.titleLabel?.lineBreakMode = .byWordWrapping
        followedButton.setTitle("\(followedCount)\n\(Constants.textFollowedLabelTitle)", for: .normal)
        followedButton.setTitleColor(Color.titleBlackColor, for: .normal)
        followedButton.sizeToFit()
        
        let connectionsStackView = UIStackView(arrangedSubviews: [followersButton, followedButton])
        connectionsStackView.axis = .horizontal
        connectionsStackView.spacing = 6
        
        let stackViewSeparatorLine = UIView()
        stackViewSeparatorLine.backgroundColor = Color.backgroundGrayColor
        
        nameLabel = UILabel()
        nameLabel.textColor = Color.titleBlackColor
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        aboutLabel = UILabel()
        aboutLabel.textColor = Color.titleBlackColor
        aboutLabel.font = UIFont.systemFont(ofSize: 12)
        
        let bottomSeparatorLine = UIView()
        bottomSeparatorLine.backgroundColor = Color.backgroundGrayColor
        
        addSubview(profileImageView)
        addSubview(connectionsStackView)
        addSubview(nameLabel)
        addSubview(aboutLabel)
        addSubview(bottomSeparatorLine)
        
        connectionsStackView.addSubview(stackViewSeparatorLine)
        
        profileImageView.snp.makeConstraints { make in
            make.left.top.equalTo(0).inset(Constants.contentInset)
            make.right.equalTo(connectionsStackView.snp.left)
            make.height.equalTo(profileImageView.snp.width)
        }
        
        connectionsStackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImageView)
            make.right.equalTo(0).inset(Constants.contentInset)
        }
        
        stackViewSeparatorLine.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom)
            make.left.equalTo(profileImageView)
        }
        
        aboutLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalTo(nameLabel)
        }
        
        bottomSeparatorLine.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
