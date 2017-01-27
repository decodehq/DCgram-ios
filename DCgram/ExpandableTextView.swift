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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpandable(text: String) {
        originalAttributedText = NSAttributedString(string: text) //, attributes: [String : Any]?)
        shorten(this: originalAttributedText)
    }
    
    func setExpandable(attributedText: NSAttributedString) {
        originalAttributedText = attributedText
        shorten(this: originalAttributedText)
    }
    
 //MARK: - Private
    
    private var originalAttributedText = NSAttributedString(string: "")
    private var collapsedLength: Int
    
    private lazy var trimmingLink: NSAttributedString = {
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.append(self.trimmingElement.trimmingText)
        attributedString.addAttribute(NSLinkAttributeName, value: self.trimmingElement.URLIdentificator, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }()
    
    private func shorten(this text: NSAttributedString) {
        if text.length >= collapsedLength && collapsed {
            let newText = NSMutableAttributedString()
                
            newText.append(text.attributedSubstring(from: NSRange(location: 0, length: collapsedLength )))
            newText.append(trimmingLink)
            
            attributedText = newText
        } else {
            attributedText = text
        }
        sizeToFit()
    }
    
    private func expand() {
//        attributedText = appropriateStyle(for: originalAttributedText)
        
        attributedText =  originalAttributedText

        sizeToFit()
    }
    
//    private func appropriateStyle(for text: NSAttributedString) -> NSMutableAttributedString {
//        
//        let newText = NSMutableAttributedString()
//        newText.append(text)
//        
//        if let defaultFont = font {
//            newText.addAttribute(NSFontAttributeName, value: defaultFont, range: NSRange(location: 0, length: text.length))
//        }
//        
//        if let defaultColor = textColor {
//            newText.addAttribute(NSForegroundColorAttributeName, value: defaultColor, range: NSRange(location: 0, length: text.length))
//        }
//        return newText
//    }
}
