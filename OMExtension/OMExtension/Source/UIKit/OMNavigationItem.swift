//
//  OMNavigationItem.swift
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

// MARK: activityIndicator

public extension OMExtension where OMBase: UINavigationItem {
    
    func startActivity(position: OMPosition) {
        
        base.startActivityIndicator(position: position)
    }
    
    func stopActivity() {
        
        base.stopActivityIndicator()
    }
}

public enum OMPosition {
    
    case left, center, right
}

private var _omPosition: Void?
private var _omCustomView: Void?

fileprivate extension UINavigationItem {
    
    var position: OMPosition? {
        
        get {
            return objc_getAssociatedObject(self, &_omPosition) as? OMPosition
        }
        
        set {
            objc_setAssociatedObject(self, &_omPosition, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var customView: UIView? {
        
        get {
            return objc_getAssociatedObject(self, &_omCustomView) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &_omCustomView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func startActivityIndicator(position: OMPosition) {
        
        stopActivityIndicator()
        
        #if os(tvOS)
            let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        #else
            let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        #endif
        
        
        switch position {
        case .left:
            self.customView = self.leftBarButtonItem?.customView
            self.leftBarButtonItem?.customView = activityIndicatorView
        case .center:
            self.customView = self.titleView
            self.titleView = activityIndicatorView
        case .right:
            self.customView = self.rightBarButtonItem?.customView
            self.rightBarButtonItem?.customView = activityIndicatorView
        }
        
        activityIndicatorView.startAnimating()
        
        self.position = position
    }
    
    func stopActivityIndicator() {
        
        guard let position = position else {
            return
        }
        
        switch position {
        case .left:
            self.leftBarButtonItem?.customView = customView
        case .center:
            self.titleView = customView
        case .right:
            self.rightBarButtonItem?.customView = customView
        }
        
        self.position = nil
        self.customView = nil
    }
}

#endif
