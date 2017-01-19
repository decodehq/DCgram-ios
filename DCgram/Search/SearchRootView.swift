//
//  SearchRootView.swift
//  DCgram
//
//  Created by Toni on 17/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class SearchRootView: UIView {
    
    private var collectionViewHeight: CGFloat = 0
    
    private(set) lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = Color.backgroundWhiteColor
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.backgroundWhiteColor
        
        addSubview(searchCollectionView)
        
        searchCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
