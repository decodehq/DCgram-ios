//
//  SignInView.swift
//  DCgram
//
//  Created by Ante Baus on 29/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit
import SnapKit
import GoogleSignIn

class SignInView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let button = GIDSignInButton()
        
        addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        backgroundColor = .cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
