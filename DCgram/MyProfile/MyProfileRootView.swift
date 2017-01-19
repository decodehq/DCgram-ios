//
//  MyProfileRootView.swift
//  DCgram
//
//  Created by Toni on 18/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class MyProfileRootView: UIView {
    private struct Constants {
        static let kTextFollowersLabelTitle = NSLocalizedString("Followers", comment: "Title for Followers text label on screen where user can see his profile data.")
        static let kTextFollowedLabelTitle = NSLocalizedString("Followed", comment: "Title for Followed text label on screen where user can see his profile data.")
        
        static let contentInset = UIEdgeInsets(top: 15, left: 16, bottom: 16, right: 16)
    }
    
    private(set) var followersCount: String?
    private(set) var followedCount: String?
    
    private(set) var followersButton: UIButton!
    private(set) var followedButton: UIButton!
    
    private(set) var nameLabel: UILabel!
    private(set) var aboutLabel: UILabel!
    
    private(set) lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    private(set) var profileImage: UIImage? = {
        let image = ImageAssets.myProfileTabBarITem
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.backgroundWhiteColor
        
        let profileInfoView = UIView()
        
        let profileSeparatorLine = UIView()
        profileSeparatorLine.backgroundColor = Color.backgroundGrayColor
        
        let profileImageView = UIImageView()
        profileImageView.image = profileImage
        profileImageView.contentMode = .scaleAspectFill
        
        followersButton = UIButton()
        followersButton.titleLabel?.lineBreakMode = .byWordWrapping
        followersButton.setTitle("\(followersCount)\n\(Constants.kTextFollowersLabelTitle)", for: .normal)
        followersButton.setTitleColor(Color.titleBlackColor, for: .normal)
        followersButton.sizeToFit()
        
        followedButton = UIButton()
        followedButton.titleLabel?.lineBreakMode = .byWordWrapping
        followedButton.setTitle("\(followedCount)\n\(Constants.kTextFollowedLabelTitle)", for: .normal)
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
        
        profileInfoView.addSubview(profileImageView)
        profileInfoView.addSubview(profileSeparatorLine)
        profileInfoView.addSubview(connectionsStackView)
        profileInfoView.addSubview(nameLabel)
        profileInfoView.addSubview(aboutLabel)
        
        connectionsStackView.addSubview(stackViewSeparatorLine)
        
        profileImageView.snp.makeConstraints { make in
            make.left.top.equalTo(0).inset(Constants.contentInset)
            make.height.equalTo(profileInfoView).multipliedBy(0.5)
            make.width.equalTo(profileImageView.snp.height)
        }
        
        connectionsStackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImageView)
            make.right.equalTo(0).inset(Constants.contentInset)
        }
        
        stackViewSeparatorLine.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        
        profileSeparatorLine.snp.makeConstraints { make in
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
        
        addSubview(profileInfoView)
        addSubview(photosCollectionView)
        
        profileInfoView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.34)
        }
        
        photosCollectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(profileInfoView.snp.bottom)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
