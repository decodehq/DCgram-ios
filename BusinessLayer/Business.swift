//
//  Business.swift
//  DCgram
//
//  Created by Ante Baus on 30/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import Foundation

public class Business {
    public static func configure(api: APIProtocol) {
        AuthenticationService.authenticator = api
    }
}
