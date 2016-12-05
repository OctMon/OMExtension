//
//  OMTextView.swift
//  OMExtension
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 OctMon
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

#if os(iOS)

import UIKit

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}

public extension OMExtension where OMBase: UITextView {
    
    func addTextLimit(length: Int, limitHandler: (() -> Void)? = nil) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextViewTextDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            if (((self.base.text! as NSString).length > length) && self.base.markedTextRange == nil) {
                
                self.base.text = (self.base.text! as NSString).substring(to: length)
                
                limitHandler?()
            }
        }
    }
    
    func addDoneButton(barStyle: UIBarStyle = .default, title: String? = "完成") {
        
        let toolbar = UIToolbar()
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: title, style: .done, target: self, action: #selector(UITextView.doneAction))]
        
        toolbar.barStyle = barStyle
        toolbar.sizeToFit()
        
        base.inputAccessoryView = toolbar
    }
}

public extension UITextView {
    
    @objc fileprivate func doneAction() { endEditing(true) }
}

public extension UITextView {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `textView.om.addTextLimit` instead.", renamed: "om.addTextLimit")
    func omSetLimit(_ length: Int, limitHandler: (() -> Void)? = nil) {
        
        om.addTextLimit(length: length, limitHandler: limitHandler)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `textView.om.addDoneButton` instead.", renamed: "om.addDoneButton")
    func omAddDoneButton(_ barStyle: UIBarStyle = .default, title: String? = "完成") {
        
        om.addDoneButton(barStyle: barStyle, title: title)
    }
}

#endif
