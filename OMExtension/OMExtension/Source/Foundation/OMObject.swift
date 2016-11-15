//
//  OMObject.swift
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

public extension OMExtension where OMBase: NSObject {
    
    /// ♻️deinit
    var deinitLog: String {
        
        return ("\(type(of: base))♻️deinit")
    }
    
    /// 获取类型名称
    var className: String {
        
        return String(describing: type(of: base))
    }
}

public extension NSObject {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `object.om.deinitLog` instead.", renamed: "om.deinitLog")
    /// ♻️deinit
    var omDeinitLog: String {
        
        return om.deinitLog
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `object.om.className` instead.", renamed: "om.className")
    /// 获取类型名称
    var omClassName: String {
        
        return om.className
    }
    
    /// 获取类型名称
    fileprivate static var className: String {
        
        return String(describing: self)
    }
    
//    @available(*, deprecated, message: "Extensions directly deprecated. Use `NSObject.OM.className` instead.", renamed: "OM.className")
    /// 获取类型名称
    static var omClassName: String {
        
        return String(describing: self)
    }

}
