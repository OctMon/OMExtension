//
//  OMTextField.swift
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

#if !os(macOS) && !os(watchOS)

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

public extension OMExtension where OMBase: UITextField {
    
    func addTextLimit(length: Int, limitHandler: (() -> Void)? = nil) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            if (((self.base.text! as NSString).length > length) && self.base.markedTextRange == nil) {
                
                self.base.text = (self.base.text! as NSString).substring(to: length)
                
                limitHandler?()
            }
        }
    }
    
    #if !os(tvOS)
    
    func addDoneButton(barStyle: UIBarStyle = .default, title: String? = "完成") {
        
        let toolbar = UIToolbar()
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: title, style: .done, target: self, action: #selector(UITextField.doneAction))]
        
        toolbar.barStyle = barStyle
        toolbar.sizeToFit()
        
        base.inputAccessoryView = toolbar
    }
    
    #endif
    
    func addLeftSpace(padding: CGFloat) {
        
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: padding, height: base.frame.height)
        self.base.leftView = leftView
        self.base.leftViewMode = UITextFieldViewMode.always
    }
    
    func addLeftIcon(image: UIImage, padding: CGFloat = 8) {
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        self.base.leftView = imageView
        self.base.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.base.leftViewMode = UITextFieldViewMode.always
    }
    
    func setPlaceholderColor(_ color: UIColor) {
        
        base.attributedPlaceholder = base.placeholder?.omGetAttributes(color: [(color, base.placeholder)])
    }
}

public extension UITextField {
    
    @objc fileprivate func doneAction() { endEditing(true) }
}

public extension UITextField {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `textField.om.addTextLimit` instead.", renamed: "om.addTextLimit")
    func omSetLimit(_ length: Int, limitHandler: (() -> Void)? = nil) {
        
        om.addTextLimit(length: length, limitHandler: limitHandler)
    }
    #if !os(tvOS)
    @available(*, deprecated, message: "Extensions directly deprecated. Use `textField.om.addDoneButton` instead.", renamed: "om.addDoneButton")
    func omAddDoneButton(_ barStyle: UIBarStyle = .default, title: String? = "完成") {
        
        om.addDoneButton(barStyle: barStyle, title: title)
    }
    #endif
    @available(*, deprecated, message: "Extensions directly deprecated. Use `textField.om.addLeftSpace` instead.", renamed: "om.addLeftSpace")
    func omAddLeftPadding(_ padding: CGFloat) {
        
        om.addLeftSpace(padding: padding)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `textField.om.addLeftIcon` instead.", renamed: "om.addLeftIcon")
    func omAddLeftIcon(_ image: UIImage, padding: CGFloat = 8) {
        
        om.addLeftIcon(image: image, padding: padding)
    }

}

#endif
