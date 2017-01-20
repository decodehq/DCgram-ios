//
//  PhotosGalleryVMProtocol.swift
//  DCgram
//
//  Created by Toni on 19/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

protocol PhotosGalleryVMProtocol {
    func getNumberOfSections() -> Int
    func getNumberOfItemsInSection() -> Int
    
    func getImage(for item: Int) -> UIImage?
}
