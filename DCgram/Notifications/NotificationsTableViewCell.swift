//
//  NotificationsTableViewCell.swift
//  DCgram
//
//  Created by Toni on 18/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class NotificationsTableViewCell: UITableViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageAssets.profilePlaceholderImage
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        addSubview(titleLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(8)
            make.centerY.equalTo(self)
            make.height.equalTo(42)
            make.width.equalTo(profileImageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileImageView.snp.right).offset(8)
            make.centerY.equalTo(profileImageView)
            make.right.equalTo(self).inset(6)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: not implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = ImageAssets.profilePlaceholderImage
        titleLabel.text = ""
    }
}
