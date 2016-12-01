//
//  OMThread.swift
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

public extension Thread {
    
    struct OM {
        
        public static func runInMain(delay: TimeInterval = 0, handler: @escaping () -> Void) {
            
            if delay <= 0 {
                
                DispatchQueue.main.async(execute: handler)
                
            } else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: handler)
            }
        }
        
        public static func runInGlobal(qos: DispatchQoS.QoSClass = .default, delay: TimeInterval = 0, handler: @escaping () -> Void) {
            
            if delay <= 0 {
                
                DispatchQueue.global(qos: .default).async(execute: handler)
                
            } else {
                
                DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + delay, execute: handler)
            }
        }
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `Thread.OM.runInMain` instead.", renamed: "OM.runInMain")
    static func omRunInMainThread(delay: TimeInterval = 0, handler: @escaping () -> Void) {
        
        OM.runInMain(delay: delay, handler: handler)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `Thread.OM.runInGlobal` instead.", renamed: "OM.runInGlobal")
    static func omRunInBackgroundThread(delay: TimeInterval = 0, handler: @escaping () -> Void) {
        
        OM.runInGlobal(delay: delay, handler: handler)
    }
}
