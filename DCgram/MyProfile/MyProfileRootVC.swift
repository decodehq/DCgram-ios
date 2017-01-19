//
//  MyProfileRootVC.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class MyProfileRootVC: UIViewController {
    private struct Constants {
        static let kTextTitle = NSLocalizedString("My Profile", comment: "Title for the navigation bar, user can see it on My Profile screen")
    }
    
    var mainView: MyProfileRootView { return view as! MyProfileRootView } //swiftlint:disable:this force_cast
    var viewModel: MyProfileRootVMProtocol
        
    init(viewModel: MyProfileRootVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = MyProfileRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        mainView.nameLabel.text = "aaaasadadadadad"
        mainView.aboutLabel.text = "asadadadadsad"
        
        mainView.photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.dc_reuseClassIdentifier)
        
        mainView.photosCollectionView.dataSource = self
        mainView.photosCollectionView.delegate = self
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyProfileRootVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.dc_reuseClassIdentifier, for: indexPath) as! PhotosCollectionViewCell // swiftlint:disable:this force_cast
        
        cell.imageView.image = viewModel.getImage(for: indexPath.item)
        
        return cell
    }
}

extension MyProfileRootVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = CGFloat(collectionView.bounds.size.width/3)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
