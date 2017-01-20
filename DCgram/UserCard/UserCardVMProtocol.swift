//
//  UserCardVMProtocol.swift
//  DCgram
//
//  Created by Toni on 20/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

protocol UserCardVMProtocol {
    var name: String {get}

    var profileImage: UIImage? {get}
    var about: String? {get}
    
    var followersCount: String {get}
    var followedCount: String {get}

}
