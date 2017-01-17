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
    
    var searchRootView: SearchRootView { return view as! SearchRootView } //swiftlint:disable:this force_cast
    
    private var collectionViewHeight: CGFloat = 0
    
    override func loadView() {
        view = SearchRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        searchRootView.searchCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.dc_reuseClassIdentifier)
        
        searchRootView.searchCollectionView.dataSource = self
        searchRootView.searchCollectionView.delegate = self
        
    }

}

extension SearchRootVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return viewModel.numberOfSections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.numberOfItemsInSection
        return 19
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.dc_reuseClassIdentifier, for: indexPath) as! SearchCollectionViewCell // swiftlint:disable:this force_cast
        
        return cell
    }
}

extension SearchRootVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = CGFloat(collectionView.bounds.size.width/3)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
