//
//  OMScreen.swift
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

public extension UIScreen {
    
    struct OM {
        
        #if !os(tvOS)
        
        public static var isPortrait: Bool {
            
            return UIDevice.current.orientation.isPortrait
        }
        
        #endif
        
        public static var width: CGFloat {
            
            return UIScreen.main.bounds.size.width
        }
        
        public static var height: CGFloat {
            
            return UIScreen.main.bounds.size.height
        }
        
        public static var size: CGSize {
            
            return UIScreen.main.bounds.size
        }
        
        public static var bounds: CGRect {
            
            return UIScreen.main.bounds
        }
    }
    #if !os(tvOS)
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.OM.isPortrait` instead.", renamed: "OM.isPortrait")
    static var omIsPortrait: Bool {
        
        return OM.isPortrait
    }
    #endif
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.OM.width` instead.", renamed: "OM.width")
    static var omGetWidth: CGFloat {
        
        return OM.width
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.OM.height` instead.", renamed: "OM.height")
    static var omGetHeight: CGFloat {
        
        return OM.height
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.OM.size` instead.", renamed: "OM.size")
    static var omGetSize: CGSize {
        
        return OM.size
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.OM.bounds` instead.", renamed: "OM.bounds")
    static var omGetBounds: CGRect {
        
        return OM.bounds
    }
}

#endif
