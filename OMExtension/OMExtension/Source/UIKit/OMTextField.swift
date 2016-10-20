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
import UIKit

public extension UITextField {
    
    func omSetLimit(length: Int) {
        
        NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) in
            
            if ((self.text?.characters.count > length) && self.markedTextRange == nil) {
                
                self.text = self.text!.substringToIndex(self.text!.endIndex.advancedBy(-1))
            }
        }
    }
    
    func omAddDoneButton(barStyle: UIBarStyle = .Default, title: String? = "完成") {
        
        let toolbar = UIToolbar()
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil), UIBarButtonItem(title: title, style: .Done, target: self, action: #selector(UIResponder.resignFirstResponder))]
        
        toolbar.barStyle = barStyle
        toolbar.sizeToFit()
        
        inputAccessoryView = toolbar
    }
    
    func omAddLeftPadding(padding: CGFloat) {
        
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: padding, height: frame.height)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.Always
    }
    
    func omAddLeftIcon(image: UIImage, padding: CGFloat = 8) {
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .Center
        self.leftView = imageView
        self.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.leftViewMode = UITextFieldViewMode.Always
    }

}
