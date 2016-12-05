//
//  OMNavigationBar.swift
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

public extension OMExtension where OMBase: UINavigationBar {
    
    func setTransparent(transparent: Bool, translucent: Bool = true) {
        
        if transparent {
            
            self.base.setBackgroundImage(UIImage(), for: .default)
            self.base.shadowImage = UIImage()
            self.base.isTranslucent = translucent
            
        } else {
            
            self.base.setBackgroundImage(nil, for: .default)
            self.base.shadowImage = nil
            self.base.isTranslucent = translucent
        }
    }
}

public extension UINavigationBar {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `navigationBar.om.setTransparent` instead.", renamed: "om.setTransparent")
    public func omTransparent(_ transparent: Bool, translucent: Bool = true) {
        
        om.setTransparent(transparent: translucent, translucent: transparent)
    }
    
}

#endif
