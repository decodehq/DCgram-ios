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
    
    private var collectionViewHeight: CGFloat = 0
    
    private(set) lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    private var profileImage: UIImage? = {
        let image = ImageAssets.myProfileTabBarITem
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let profileContentView = UIView()
        let profileImageView = UIImageView()
        profileImageView.image = profileImage
        
        addSubview(profileContentView)
        addSubview(searchCollectionView)
        
        profileContentView.addSubview(profileImageView)
        
        profileContentView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self)
            make.height.equalTo(120) //test
        }
        
        profileImageView.snp.makeConstraints { make in
            make.left.top.equalTo(0)
        }
        
        searchCollectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(profileContentView.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
