//
//  SearchTextField.swift
//  DCgram
//
//  Created by Toni on 17/01/2017.
//  Copyright © 2017 DECODE HQ. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {
    var isValid: Bool = false {
        didSet {
            switch isValid {
            case true:
                textColor = .white
            case false:
                textColor = .white
            }
        }
    }
    
    private let contentInset = UIEdgeInsets(top: 0, left: 46, bottom: 0, right: 18)
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    private func commonInit() {
        textColor = .blue
        font = UIFont.systemFont(ofSize: 16)
        clearButtonMode = .whileEditing
        backgroundColor = .white
        leftView = UIImageView(image: UIImage(named: "search-icon"))
        leftViewMode = .always
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: UIViewNoIntrinsicMetric, height: 50)
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, contentInset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, contentInset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, contentInset)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var leftViewRect = super.leftViewRect(forBounds: bounds)
        leftViewRect.origin.x += 12
        return leftViewRect
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
