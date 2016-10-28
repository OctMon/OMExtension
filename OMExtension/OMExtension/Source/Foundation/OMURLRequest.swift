//
//  OMURLRequest.swift
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

private let omRequestSeparator = "\n->->->->->->->->->->Request->->->->->->->->->\n"

public extension URLRequest {
    
    func omPrintLog(isPrintBase64DecodeBody: Bool = false) {
        
        let omUrl = url?.absoluteString ?? ""
        let omHttpMethod = httpMethod ?? ""
        let omTimeout = timeoutInterval
        let omHttpBody = httpBody?.omToJson()
        
        var log = "\(omRequestSeparator)[URL]\n\(omUrl)\n[Method]\n\(omHttpMethod)\n[Timeout]\n\(omTimeout)"
        
        if let allHTTPHeaderFields = allHTTPHeaderFields, allHTTPHeaderFields.count > 0, let header = Data.omToJson(from: allHTTPHeaderFields) {
            
            log += "\n[Header]\n\(header)"
        }
        
        if let body = omHttpBody {
            
            log += "\n[Body]\n\(body)"
            
            if let json = Data(base64Encoded: body, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)?.omToJson(), isPrintBase64DecodeBody {
                
                log += "\n[Base64DecodeBody]\n\(json)"
            }
        }
        
        print(log + omRequestSeparator)
    }
}
