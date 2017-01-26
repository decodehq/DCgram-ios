//
//  FeedRootVMProtocol.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

protocol FeedRootVMProtocol {
    
    var numberOfItems: Int { get }
    
    func image(for index: Int) -> UIImage
    
    func username(for index: Int) -> String
    func userImage(for index: Int) -> UIImage
    func photoComment(for index: Int) -> String
    func numberOfLikes(for index: Int) -> Int
    func numberOfComments(for index: Int) -> Int
}
