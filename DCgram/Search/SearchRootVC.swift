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
    
    var viewModel: SearchRootVMProtocol
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
        
    init(viewModel: SearchRootVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        let vm = PhotosGalleryVM()
        let vc = PhotosGalleryVC(viewModel: vm)
        dc_attachChildVC(vc)
        
        vc.mainView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        searchBar.placeholder = Constants.kTextSearchPlaceholderTitle
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
