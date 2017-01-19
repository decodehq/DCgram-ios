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
    
    private(set) var followersCountLabel: UILabel!
    private(set) var followedCountLabel: UILabel!
    
    private(set) lazy var searchCollectionView: UICollectionView = {
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
        
        followersCountLabel = UILabel()
        followedCountLabel = UILabel()
        
        let followersLabel = UILabel()
        followersLabel.text = Constants.kTextFollowersLabelTitle
        let followedLabel = UILabel()
        followedLabel.text = Constants.kTextFollowedLabelTitle
        
        let followersStackView = UIStackView(arrangedSubviews: [followersCountLabel, followersLabel])
        let followedStackView = UIStackView(arrangedSubviews: [followedCountLabel, followedLabel])
        
        let connectionsInfoStackView = UIStackView(arrangedSubviews: [followersStackView, followedStackView])
        connectionsInfoStackView.axis = .horizontal
        
        profileInfoView.addSubview(profileImageView)
        profileInfoView.addSubview(profileSeparatorLine)
        profileInfoView.addSubview(connectionsInfoStackView)
        
        profileImageView.snp.makeConstraints { make in
            make.left.top.equalTo(0).inset(Constants.contentInset)
            make.height.equalTo(profileInfoView).multipliedBy(0.5)
            make.width.equalTo(profileImageView.snp.height)
        }
        
        connectionsInfoStackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImageView)
            make.right.equalTo(0).inset(Constants.contentInset)
        }
        
        profileSeparatorLine.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        
        addSubview(profileInfoView)
        addSubview(searchCollectionView)
        
        profileInfoView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.34)
        }
        
        searchCollectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(profileInfoView.snp.bottom)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
