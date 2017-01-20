//
//  UserCardVM.swift
//  DCgram
//
//  Created by Toni on 20/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class UserCardVM: UserCardVMProtocol {
    var name: String = "Toni Vujevic"
    
    var profileImage: UIImage? = ImageAssets.profilePlaceholderImage
    var about: String? = "danas je lijep i sunčan dan"
    
    var followersCount: String = "434"
    var followedCount: String = "99"
}
