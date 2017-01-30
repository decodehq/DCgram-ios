//
//  ExpandableTextView.swift
//  DCgram
//
//  Created by Toni on 26/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import Foundation

struct TrimmingElement {
    var trimmingText = NSAttributedString(string: "...more")
    let URLIdentificator = "expand-identificator-key"
}

class ExpandableTextView: UITextView {
    
    var trimmingElement: TrimmingElement
    
    var collapsed: Bool = true {
        didSet {
            if collapsed {
                shorten(this: originalAttributedText)
            } else {
                expand()
            }
        }
    }
    
    init(collapsedLength: Int, trimmingElement: TrimmingElement) {
        self.trimmingElement = trimmingElement
        self.collapsedLength = collapsedLength
        
        super.init(frame: CGRect.zero, textContainer: nil)
        
        isEditable = false
        isScrollEnabled = false
        
        linkTextAttributes = [:]
//        linkTextAttributes = [NSForegroundColorAttributeName : UIColor.red]
        
        dataDetectorTypes = .link
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpandable(text: String) {
        originalAttributedText = addLinks(to: NSAttributedString(string: text))
        shorten(this: originalAttributedText)
    }
    
    func setExpandable(attributedText: NSAttributedString) {
        originalAttributedText = addLinks(to: attributedText)
        shorten(this: originalAttributedText)
    }
    
 //MARK: - Private
    
    private var originalAttributedText: NSAttributedString!
    private var collapsedLength: Int
    
    private lazy var trimmingLink: NSAttributedString = {
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.append(self.trimmingElement.trimmingText)
        attributedString.addAttribute(NSLinkAttributeName, value: self.trimmingElement.URLIdentificator, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }()
    
    private func shorten(this text: NSAttributedString) {
        if text.length >= collapsedLength && collapsed {
            let shortText = NSMutableAttributedString()
                
            shortText.append(text.attributedSubstring(from: NSRange(location: 0, length: collapsedLength )))
            shortText.append(trimmingLink)
            
            attributedText = shortText
        } else {
            attributedText = text
        }
        sizeToFit()
    }
    
    private func expand() {
        attributedText =  originalAttributedText
        sizeToFit()
    }
    
    private func addLinks(to text: NSAttributedString) -> NSAttributedString {
        
        let textWithLinks = NSMutableAttributedString()
        textWithLinks.append(text)
        
        let range = NSMakeRange(0, textWithLinks.length)
        
        let regexForUsername = try? NSRegularExpression(pattern: "@([\\w]+)", options: [])
        let regexForHashtag = try? NSRegularExpression(pattern: "#([\\w]+)", options: [])
        
        let matchesForUsername = (regexForUsername?.matches(in: textWithLinks.string, options: [], range: range))!
        let matchesForHashtag = (regexForHashtag?.matches(in: textWithLinks.string, options: [], range: range))!
        
        for match in matchesForUsername {
            textWithLinks.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 14), range: match.rangeAt(0))
            textWithLinks.addAttribute(NSLinkAttributeName, value: textWithLinks.attributedSubstring(from: match.rangeAt(0)).string, range: match.rangeAt(0))
        }
        
        for match in matchesForHashtag {
            textWithLinks.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 14), range: match.rangeAt(0))
            textWithLinks.addAttribute(NSLinkAttributeName, value: textWithLinks.attributedSubstring(from: match.rangeAt(0)).string, range: match.rangeAt(0))
        }
        
        return textWithLinks
    }
}
