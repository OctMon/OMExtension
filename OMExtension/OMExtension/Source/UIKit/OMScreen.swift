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
import UIKit

public extension UIScreen {
    
    struct OM {
        
        public static var isPortrait: Bool {
            
            return UIDevice.current.orientation.isPortrait
        }
        
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
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.om.isPortrait` instead.", renamed: "om.isPortrait")
    static var omIsPortrait: Bool {
        
        return OM.isPortrait
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.om.width` instead.", renamed: "om.width")
    static var omGetWidth: CGFloat {
        
        return OM.width
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.om.height` instead.", renamed: "om.height")
    static var omGetHeight: CGFloat {
        
        return OM.height
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.om.size` instead.", renamed: "om.size")
    static var omGetSize: CGSize {
        
        return OM.size
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIScreen.om.bounds` instead.", renamed: "om.bounds")
    static var omGetBounds: CGRect {
        
        return OM.bounds
    }
}
