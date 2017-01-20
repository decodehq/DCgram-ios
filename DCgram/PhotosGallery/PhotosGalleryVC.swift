//
//  PhotosGalleryVC.swift
//  DCgram
//
//  Created by Toni on 19/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation
import UIKit

class PhotosGalleryVC: UIViewController {
    
    var mainView: PhotosGalleryView { return view as! PhotosGalleryView } //swiftlint:disable:this force_cast
    var viewModel: PhotosGalleryVMProtocol
    
    init(viewModel: PhotosGalleryVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = PhotosGalleryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        mainView.photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.dc_reuseClassIdentifier)
        
        mainView.photosCollectionView.dataSource = self
        mainView.photosCollectionView.delegate = self

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosGalleryVC: UICollectionViewDataSource {
    
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

extension PhotosGalleryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = CGFloat(collectionView.bounds.size.width/3)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
