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
        tableView.estimatedRowHeight = 400.0
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.backgroundWhiteColor
        tableView.allowsSelection = false
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resizeRows(animated: Bool) {
        UIView.setAnimationsEnabled(animated)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(animated)
    }
}
