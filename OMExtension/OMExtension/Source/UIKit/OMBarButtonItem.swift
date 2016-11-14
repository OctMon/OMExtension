//
//  OMBarButtonItem.swift
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

public extension OMExtension where OMBase: UIBarButtonItem {
    
    /// 点击回调
    ///
    /// - Parameter handler: 使用 [unowned self] 或 [weak self] 避免循环引用
    func clickHandler(handler: @escaping () -> Void) {
        
        base.omClickHandler(handler: handler)
    }
}

private var _omStruct: Void?

fileprivate extension UIBarButtonItem {
    
    private struct OMStruct {
        
        var omHandler: (() -> Void)?
    }
    
    private var omStruct: OMStruct? {
        
        get {
            return objc_getAssociatedObject(self, &_omStruct) as? OMStruct
        }
        
        set {
            objc_setAssociatedObject(self, &_omStruct, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc private func clickAction() {
        
        omStruct?.omHandler?()
    }
    
    /// 点击回调
    ///
    /// - Parameter handler: 使用 [unowned self] 或 [weak self] 避免循环引用
    func omClickHandler(handler: @escaping () -> Void) {
        
        omStruct = OMStruct(omHandler: handler)
        
        target = self
        action = #selector(clickAction)
    }
}