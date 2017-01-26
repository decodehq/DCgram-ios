//
//  ExpandableTextView.swift
//  DCgram
//
//  Created by Toni on 26/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

struct TrimmingElement {
    var trimmingText = "...more"
    let URLIdentificator = "expand"
}

class ExpandableTextView: UITextView {
    
    var trimmingElement: TrimmingElement
    
    override open var text: String! {
        get {
            return originalText
        }
        set{
            originalText = newValue
            shorten()
            sizeToFit()
        }
    }
    
    var collapsed: Bool = true {
        didSet {
            if collapsed {
                shorten()
            } else {
                expand()
            }
        }
    }
    
    init(trimmingElement: TrimmingElement, collapsedLength: Int) {
        
        self.trimmingElement = trimmingElement
        self.collapsedLength = collapsedLength
        
        super.init(frame: CGRect.zero, textContainer: nil)
        
        isEditable = false
        isScrollEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 //MARK: - Private

    private var originalText: String = ""
    private var collapsedLength: Int
    
    private lazy var trimmingLink: NSAttributedString = {
        let attributedString = NSMutableAttributedString(string: self.trimmingElement.trimmingText, attributes: [:])
        attributedString.addAttribute(NSLinkAttributeName, value: self.trimmingElement.URLIdentificator, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }()
    
    private func shorten() {
        if originalText.characters.count >= collapsedLength && collapsed {
            let index = originalText.index(originalText.startIndex, offsetBy: collapsedLength)
            let shortenedText = originalText.substring(to: index)
            let newText = NSMutableAttributedString(string: shortenedText + trimmingLink.string)
            newText.addAttribute(NSLinkAttributeName, value: trimmingElement.URLIdentificator, range: NSRange(location: shortenedText.characters.count, length: trimmingLink.length))
            
            attributedText = newText
        }
    }
    
    private func expand() {
        attributedText = NSAttributedString(string: originalText)
        sizeToFit()
    }
}
