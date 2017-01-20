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
        return titleLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        addSubview(titleLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(-6)
            make.centerY.equalTo(self)
            make.height.equalTo(42)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileImageView.snp.right)
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
