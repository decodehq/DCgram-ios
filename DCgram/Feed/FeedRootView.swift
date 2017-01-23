//
//  FeedRootView.swift
//  DCgram
//
//  Created by Toni on 23/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import UIKit

class FeedRootView: UIView {
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.backgroundWhiteColor
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
