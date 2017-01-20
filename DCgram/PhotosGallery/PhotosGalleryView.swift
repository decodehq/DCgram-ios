//
//  PhotosGalleryView.swift
//  DCgram
//
//  Created by Toni on 19/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class PhotosGalleryView: UIView {
    
    private(set) lazy var photosCollectionView: UICollectionView = {
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
                
        addSubview(photosCollectionView)
        
        photosCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
