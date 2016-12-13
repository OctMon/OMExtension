//
//  OMInt.swift
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

#if !os(macOS)
    import UIKit
#endif

public extension Int {
    
    struct OM {
        
        public static func random(_ range: Range<Int>) -> Int {
            
            return random(range.lowerBound, range.upperBound - 1)
        }
        
        public static func random(_ range: ClosedRange<Int>) -> Int {
            
            return random(range.lowerBound, range.upperBound)
        }
        
        public static func random(_ lower: Int = 0, _ upper: Int = 9) -> Int {
            
            return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
        }
    }
}

public extension Int {
    
    var omToString: String {
        
        return String(self)
    }
    
    var omToDouble: Double {
        
        return Double(self)
    }
    
    var omToFloat: Float {
        
        return Float(self)
    }
    
    var omToCGFloat: CGFloat {
        
        return CGFloat(self)
    }
    
    var omIsEven: Bool {
        
        return (self % 2 == 0)
    }
    
    var omIsOdd: Bool {
        
        return !omIsEven
    }
    
    var omAbs: Int {
        
        return abs(self)
    }
    
    var omLocaleCurrency: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        return formatter.string(from: self as NSNumber)!
    }
}
