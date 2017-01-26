//
//  FeedTableViewCell.swift
//  DCgram
//
//  Created by Toni on 23/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    private struct Constants {
        static let contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageAssets.profilePlaceholderImage
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    let feedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageAssets.placeholderImage
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let commentsCountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Color.tabBarUnselectedItemTintColor, for: .normal)
        button.titleLabel!.font =  UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
        return button
    }()
    
    let likesCountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Color.tabBarUnselectedItemTintColor, for: .normal)
        button.titleLabel!.font =  UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
        return button
    }()
    
    let giveCommentButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageAssets.notificationsTabBarITem, for: .normal)
        return button
    }()
    
    let giveLikeButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageAssets.homeTabBarITem, for: .normal)
        return button
    }()
    
    let descriptionTextView: ExpandableTextView = {
        var textView = ExpandableTextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let spacerLabel = UILabel()
        spacerLabel.text = " - "
        spacerLabel.font =  UIFont.boldSystemFont(ofSize: 14)
        
        let marksContainerView = UIView()
        marksContainerView.addSubview(likesCountButton)
        marksContainerView.addSubview(commentsCountButton)
        marksContainerView.addSubview(spacerLabel)
       
        likesCountButton.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
        }
        
        spacerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(likesCountButton.snp.right)
        }
    
        commentsCountButton.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(0)
            make.left.equalTo(spacerLabel.snp.right)
        }
        
        let giveStackView = UIStackView(arrangedSubviews: [giveLikeButton, giveCommentButton])
        giveStackView.axis = .horizontal
        giveStackView.distribution = .fillEqually
        giveStackView.spacing = 8
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(feedImageView)
        contentView.addSubview(marksContainerView)
        contentView.addSubview(giveStackView)
        contentView.addSubview(descriptionTextView)
        
        profileImageView.snp.makeConstraints { make in
            make.left.top.equalTo(self.contentView).inset(Constants.contentInset)//.priorityRequired()
            make.height.width.equalTo(42)//.priorityRequired()
        }
        
        usernameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileImageView.snp.right).offset(8)
            make.centerY.equalTo(profileImageView)
//            make.right.equalTo(self).inset(Constants.contentInset)
        }
        
        feedImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.contentView).inset(Constants.contentInset)
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
//            make.height.greaterThanOrEqualTo(200)
        }
        
        giveStackView.snp.makeConstraints { (make) in
            make.left.equalTo(feedImageView)
            make.top.equalTo(feedImageView.snp.bottom).offset(8)
            make.right.lessThanOrEqualTo(marksContainerView.snp.left).offset(-20)
//            make.height.greaterThanOrEqualTo(40)
        }
        
        marksContainerView.snp.makeConstraints { (make) in
            make.right.equalTo(feedImageView)
            make.centerY.equalTo(giveStackView)
        }

        descriptionTextView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0).inset(Constants.contentInset)
            make.top.equalTo(giveStackView.snp.bottom)
            make.bottom.equalTo(0).inset(Constants.contentInset)
            make.height.greaterThanOrEqualTo(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: not implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
//        profileImageView.image = ImageAssets.profilePlaceholderImage
//        usernameLabel.text = ""
//        feedImageView.image = nil
//
//        photoDescriptionLabel.text = nil
//        photoDescriptionLabel.linkAttributes = nil
//        photoDescriptionLabel.attributedText = nil
//        photoDescriptionLabel.attributedTruncationToken = nil
//
//        let truncatingToken = NSAttributedString(string: "...more", attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 22), NSForegroundColorAttributeName : UIColor.gray, NSLinkAttributeName : NSURL(string:"...more")!])
//
//        photoDescriptionLabel.attributedTruncationToken = truncatingToken
//        photoDescriptionLabel.numberOfLines = 3
    }
}
