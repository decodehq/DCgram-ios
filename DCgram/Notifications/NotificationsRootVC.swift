//
//  NotificationsRootVC.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class NotificationsRootVC: UIViewController {
    fileprivate struct Constants {
        static let kTextNavBarTitle = NSLocalizedString("Notifications", comment: "Title for the navigation bar on notifications view, user can see it on notifications screen")
        static let kTableCellHeight = CGFloat(54.0)
    }
    
    var mainView: NotificationsRootView { return view as! NotificationsRootView } //swiftlint:disable:this force_cast
    var viewModel: NotificationsRootVMProtocol
    
    init(viewModel: NotificationsRootVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = NotificationsRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        self.navigationItem.title = Constants.kTextNavBarTitle
        
        mainView.tableView.register(NotificationsTableViewCell.self, forCellReuseIdentifier: NotificationsTableViewCell.dc_reuseClassIdentifier)
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource

extension NotificationsRootVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationsTableViewCell.dc_reuseClassIdentifier, for: indexPath) as! NotificationsTableViewCell //swiftlint:disable:this force_cast
        
                let title = viewModel.title(for: indexPath.row)
                let image = viewModel.image(for: indexPath.row)
        
                cell.profileImageView.image = image
                cell.titleLabel.text = title
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension NotificationsRootVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.kTableCellHeight
    }
}
