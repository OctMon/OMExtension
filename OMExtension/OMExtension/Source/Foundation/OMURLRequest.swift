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
private func omStatusCodeSeparator(statusCode: Int = NSURLErrorNotConnectedToInternet) -> String { return "\n----------------------\(statusCode)------------------->" }
private let omResponseSeparator = "\n->->->->->->->->->->Response->->->->->->->->->\n"

public extension NSURLRequest {
    
    func omPrintRequestLog(isPrintBase64DecodeBody: Bool = false) {
        
        omPrintRequestLog(isPrintBase64DecodeBody, separator: [omRequestSeparator, omRequestSeparator])
    }
    
    private func omPrintRequestLog(isPrintBase64DecodeBody: Bool = false, separator: [String]) {
        
        var separator = Array(separator.reverse())
        
        let omUrl = URL?.absoluteString ?? ""
        let omHttpMethod = HTTPMethod ?? ""
        let omTimeout = timeoutInterval
        let omHttpBody = HTTPBody?.omToJson()
        
        var log = "\(separator.popLast() ?? "")[URL]\t\t\(omUrl)\n[Method]\t\(omHttpMethod)\n[Timeout]\t\(omTimeout)"
        
        if let allHTTPHeaderFields = allHTTPHeaderFields where allHTTPHeaderFields.count > 0, let header = NSData.omToJson(from: allHTTPHeaderFields) {
            
            log += "\n[Header]\n\(header)"
        }
        
        if let body = omHttpBody {
            
            log += "\n[Body]\n\(body)"
            
            if let json = NSData(base64EncodedString: body, options: .IgnoreUnknownCharacters)?.omToJson() where isPrintBase64DecodeBody {
                
                log += "\n[Body -> Base64Decode]\n\(json)"
            }
        }
        
        print(log + "\(separator.popLast() ?? "")")
    }
    
    func omPrintResponseLog(isPrintHeader: Bool = false, isPrintBase64DecodeBody: Bool = false, isPrintBase64DecodeData: Bool = false, response: NSHTTPURLResponse?, data: NSData?, error: NSError?, requestDuration: NSTimeInterval?) {
        
        var log = ""
        
        if let response = response {
            
            omPrintRequestLog(isPrintBase64DecodeBody, separator: [omResponseSeparator, omStatusCodeSeparator(response.statusCode)])
            
            if let requestDuration = requestDuration {
                
                log += "[Duration]\t\(requestDuration)"
            }
            
            if isPrintHeader, let header = NSData.omToJson(from: response.allHeaderFields) {
                
                log += "\n[Header]\n\(header)"
            }
            
        } else {
            
            omPrintRequestLog(isPrintBase64DecodeBody, separator: [omResponseSeparator, omStatusCodeSeparator()])
            
            if let requestDuration = requestDuration {
                
                log += "[Duration]\t\(requestDuration)"
            }
        }
        
        if let error = error {
            
            log += "\n[Error]\t\t\(error.localizedDescription)"
        }
        
        if let data = data {
            
            log += "\n[Size]\t\t\(data.length) bytes"
            
            if let data = data.omToJson() {
                
                log += "\n[Data]\n\(data)"
                
                if let json = NSData(base64EncodedString: data, options: .IgnoreUnknownCharacters)?.omToJson() where isPrintBase64DecodeBody {
                    
                    log += "\n[Data -> Base64Decode]\n\(json)"
                }
            }
        }
        
        print(log + omResponseSeparator)
    }
}
