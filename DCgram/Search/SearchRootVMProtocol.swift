//
//  SearchRootVMProtocol.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

protocol SearchRootVMProtocol {
    func getNumberOfSections() -> Int
    func getNumberOfItemsInSection() -> Int
    
    func updateResults()
    
    func getImage(for item: Int) -> UIImage?
}
