//
//  SearchCollectionViewCell.swift
//  DCgram
//
//  Created by Toni on 17/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    private struct Constants {
        static let contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "placeholder-image")
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(Constants.contentInset)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: not implemented")
    }
}
