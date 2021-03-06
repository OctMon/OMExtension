//
//  OMData.swift
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

public extension Data {
    
    struct OM {
        
        public static func JSONString(from json: Any?) -> String? {
            
            guard let json = json else {
                
                return nil
            }
            
            var string: String? = nil
            
            if let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted), let dataString = String(data: data, encoding: .utf8) {
                
                string = dataString
            }
            
            return string
        }
    }
    
    func omToJson() -> String? {
        
        var string: String? = nil
        
        if let json = try? JSONSerialization.jsonObject(with: self, options: []), let dataString = Data.OM.JSONString(from: json) {
            
            string = dataString
            
        } else if let dataString = String(data: self, encoding: .utf8) {
            
            string = dataString
        }
        
        return string
    }
}
