//
//  SearchRootView.swift
//  DCgram
//
//  Created by Toni on 17/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class SearchRootView: UIView {
    private struct Constants {
        static let kTextSearchPlaceholderTitle = NSLocalizedString("Pretraži", comment: "Placeholder for the search text field, user can see it on search view")
    }
    
    private(set) lazy var searchTextField: SearchTextField = {
        let textField = SearchRootView.getTextField(placeholder: Constants.kTextSearchPlaceholderTitle)
        return textField
    }()
    
    private var collectionViewHeight: CGFloat = 0
    
    private(set) lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(searchTextField)
        addSubview(searchCollectionView)
        
        searchTextField.snp.makeConstraints { make in
            make.left.right.top.equalTo(self)
        }
        
        searchCollectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(searchTextField.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func getTextField(placeholder: String) -> SearchTextField {
        let textField = SearchTextField()
        
        textField.placeholder = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        return textField
    }
}
