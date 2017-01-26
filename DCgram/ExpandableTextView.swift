//
//  ExpandableTextView.swift
//  DCgram
//
//  Created by Toni on 26/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

class ExpandableTextView: UITextView {
    
    let trimmingLink: NSAttributedString = {
        let attributedString = NSMutableAttributedString(string: "...more", attributes: [:])
        attributedString.addAttribute(NSLinkAttributeName, value: "expand", range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }()
    
    let collapsed: Bool = true
    
    var originalText: String!
    
    private var shortenedText: String!
    
//    override open var text: String! {
//        didSet {
//            attributedTextDidChange()
//        }
//    }
//    
//    override open var attributedText: NSAttributedString! {
//        didSet {
//            attributedTextDidChange()
//            attributedText =
//        }
//    }
    
    func shorten() {
        if originalText.characters.count >= 200 && collapsed {
            
            let index = originalText.index(originalText.startIndex, offsetBy: 200)
            
            shortenedText = originalText.substring(to: index)
            
            let attributedText2 = NSMutableAttributedString(string: shortenedText + trimmingLink.string)
            attributedText2.addAttribute(NSLinkAttributeName, value: "expand", range: NSRange(location: shortenedText.characters.count, length: trimmingLink.length))
            
            attributedText = attributedText2
            
        }
    }
    
    func expand() {
        attributedText = NSAttributedString(string: originalText)
        
        sizeToFit()
        
        
//        frame = CGRect(origin: frame.origin, size: contentSize)
    
    }
}
