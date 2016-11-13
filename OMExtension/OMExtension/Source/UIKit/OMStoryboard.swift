//
//  OMStoryboard.swift
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

public extension UIStoryboard {
    
    /// e.g. UIStoryboard(omName: "Storyboard 文件名").instantiateViewController(withIdentifier: "Storyboard ID")
    ///
    /// - Parameters:
    ///   - omName: name
    ///   - bundle: bundle
    convenience init(omName: String, bundle: Bundle? = nil) {
        
        self.init(name: omName, bundle: bundle)
    }
    
    /**
     通过Storyboard初始化一个UIViewController
     
     - parameter name:       Storyboard 文件名
     - parameter identifier: Storyboard ID
     
     - returns: UIViewController
     */
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIStoryboard convenience init` instead.")
    static func omInstantiateViewController(name: String, identifier: String? = nil) -> UIViewController? {
        
        if let identifier = identifier {
            
            return UIStoryboard(omName: name).instantiateViewController(withIdentifier: identifier)
            
        } else {
            
            return UIStoryboard(omName: name).instantiateInitialViewController()
        }
    }

}
