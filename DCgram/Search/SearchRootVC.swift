//
//  SearchRootVC.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class SearchRootVC: UIViewController {
    private struct Constants {
        static let kTextSearchPlaceholderTitle = NSLocalizedString("Search", comment: "Placeholder for the search text field, user can see it on search view")
    }
    
    var searchRootView: SearchRootView { return view as! SearchRootView } //swiftlint:disable:this force_cast
    var viewModel: SearchRootVMProtocol
    
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    private var collectionViewHeight: CGFloat = 0
    
    init(viewModel: SearchRootVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = SearchRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        searchRootView.searchCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.dc_reuseClassIdentifier)
        
        searchRootView.searchCollectionView.dataSource = self
        searchRootView.searchCollectionView.delegate = self
        
        searchBar.placeholder = Constants.kTextSearchPlaceholderTitle
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchRootVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfItemsInSection()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.dc_reuseClassIdentifier, for: indexPath) as! SearchCollectionViewCell // swiftlint:disable:this force_cast
        
        cell.imageView.image = viewModel.getImage(for: indexPath.item)
        
        return cell
    }
}

extension SearchRootVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = CGFloat(collectionView.bounds.size.width/3)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension SearchRootVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel.updateResults()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateResults()
    }
}
