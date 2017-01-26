//
//  FeedRootVM.swift
//  DCgram
//
//  Created by Ante Baus on 10/01/17.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class FeedRootVM: FeedRootVMProtocol {
    
    var numberOfItems: Int {
        return 40
    }
    
    func image(for index: Int) -> UIImage {
        return ImageAssets.placeholderImage!
    }
    
    func username(for index: Int) -> String {
        return "toni.vujevic88"
    }
    
    func userImage(for index: Int) -> UIImage {
        return ImageAssets.profilePlaceholderImage!
    }
    
    func photoComment(for index: Int) -> String {
        return "Most of the time when we see a code snippet online to do something, we often blindly copy paste it to the terminal. Even the tech savy ones just see it on the website before copy pasting. Here is why you shouldn't do this. Try pasting the following line to your terminal (SFW) You probably guessed it. There is some malicious code between ls and -lat that is hidden from the user. Malicious code's color is set to that of the background, it's font size is set to 0, it is moved away from rest of the code and it is made un-selectable (that blue color thing doesn't reveal it); to make sure that it works in all possible OSes, browsers and screen sizes. This can be worse. If the code snippet had a command with sudo for instance, the malicious code will have sudo access too. Or, it can silently install a keylogger on your machine; possibilities are endless. So, the lesson here is, make sure that you paste code snippets from untrusted sources onto a text editor before executing it. Thanks for reading!"
    }
    
    func numberOfLikes(for index: Int) -> Int {
        return 300
    }
    
    func numberOfComments(for index: Int) -> Int {
        return 500
    }
}
