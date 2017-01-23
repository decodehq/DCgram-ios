//
//  FeedRootVC.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import UIKit

class FeedRootVC: UIViewController {
    fileprivate struct Constants {
        static let textNavBarTitle = NSLocalizedString("Feed", comment: "Title for the navigation bar on Feed view, user can see it on Feed screen")
        static let textCommentsButtonTitle = NSLocalizedString("Comments", comment: "Title for the comments button bar on Feed view, user can see it on Feed screen")
        static let textLikesButtonTitle = NSLocalizedString("Likes", comment: "Title for the likes button bar on Feed view, user can see it on Feed screen")
        
        static let tableCellHeight = CGFloat(400.0)
    }
    
    var mainView: FeedRootView { return view as! FeedRootView } //swiftlint:disable:this force_cast
    var viewModel: FeedRootVMProtocol
    
    init(viewModel: FeedRootVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = FeedRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        self.navigationItem.title = Constants.textNavBarTitle
        
        mainView.tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.dc_reuseClassIdentifier)
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource

extension FeedRootVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.dc_reuseClassIdentifier, for: indexPath) as! FeedTableViewCell //swiftlint:disable:this force_cast
        
        let title = viewModel.title(for: indexPath.row)
        let image = viewModel.image(for: indexPath.row)
        let numberOfLikes = "43"//viewModel.image(for: indexPath.row)
        let numberOfComments = "678" //viewModel.image(for: indexPath.row)
        
        cell.profileImageView.image = image
//        cell.feedImageView.image = image
        cell.usernameLabel.text = title
        cell.likesCountButton.setTitle("\(numberOfLikes) \(Constants.textLikesButtonTitle)", for: .normal)
        cell.commentsCountButton.setTitle("\(numberOfComments) \(Constants.textCommentsButtonTitle)", for: .normal)
        cell.photoDescriptionTextView.text = "Neki analitičari smatraju kako su ciljevi Vladimira Putina, ruskog predsjednika, racionalni i obrambeni: širenje NATO-a postaje prijetnja i Rusija uzvraća udarac. Zapad širi svoj utjecaj na račun Rusije i ona se osvećuje. No, Miller smatra kako su to - gluposti. "
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FeedRootVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableCellHeight
    }
}
