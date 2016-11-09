//
//  OMButton.swift
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

private var _activityIndicatorView: Void?
private var _lastTitle: Void?

public extension UIButton {
    
    var activityIndicatorView: UIActivityIndicatorView? {
        
        get {
            return objc_getAssociatedObject(self, &_activityIndicatorView) as? UIActivityIndicatorView
        }
        
        set {
            objc_setAssociatedObject(self, &_activityIndicatorView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var lastTitle: String? {
        
        get {
            return objc_getAssociatedObject(self, &_lastTitle) as? String
        }
        
        set {
            objc_setAssociatedObject(self, &_lastTitle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func setupActivityIndicator(isAnimate: Bool) {
        
        if isAnimate {
            
            isEnabled = false
            
            lastTitle = title(for: .disabled)
            
            setTitle("", for: .disabled)
            
            activityIndicatorView = UIActivityIndicatorView(frame: bounds)
            activityIndicatorView?.color = currentTitleColor
            
            guard let activityIndicatorView = activityIndicatorView else {
                
                return
            }
            
            addSubview(activityIndicatorView)
            activityIndicatorView.startAnimating()
            
        } else {
            
            isEnabled = true
            
            setTitle(lastTitle, for: .disabled)
            
            activityIndicatorView?.stopAnimating()
            activityIndicatorView?.removeFromSuperview()
            activityIndicatorView = nil
        }
    }
    
    func omStartActivity() {
        
        setupActivityIndicator(isAnimate: true)
    }
    
    func omStopActivity() {
        
        setupActivityIndicator(isAnimate: false)
    }
}
