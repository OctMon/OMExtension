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

public extension URLRequest {
    
    @discardableResult
    func omPrintRequestLog(isPrintBase64DecodeBody: Bool = false) -> String {
        
        return omPrintRequestLog(isPrintBase64DecodeBody: isPrintBase64DecodeBody, separator: [omRequestSeparator, omRequestSeparator])
    }
    
    @discardableResult
    private func omPrintRequestLog(isPrintBase64DecodeBody: Bool = false, separator: [String]) -> String {
        
        var separator = Array(separator.reversed())
        
        let omUrl = url?.absoluteString ?? ""
        let omHttpMethod = httpMethod ?? ""
        let omTimeout = timeoutInterval
        let omHttpBody = httpBody?.omToJson()
        
        var log = "\(separator.popLast() ?? "")[URL]\t\t\(omUrl)\n[Method]\t\(omHttpMethod)\n[Timeout]\t\(omTimeout)"
        
        if let allHTTPHeaderFields = allHTTPHeaderFields, allHTTPHeaderFields.count > 0, let header = Data.OM.JSONString(from: allHTTPHeaderFields) {
            
            log += "\n[Header]\n\(header)"
        }
        
        if let body = omHttpBody {
            
            log += "\n[Body]\n\(body)"
            
            if let json = Data(base64Encoded: body, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)?.omToJson(), isPrintBase64DecodeBody {
                
                log += "\n[Body -> Base64Decode]\n\(json)"
            }
        }
        
        log += "\(separator.popLast() ?? "")"
        
        print(log)
        
        return log
    }
    
    @discardableResult
    func omPrintResponseLog(_ isPrintHeader: Bool = false, isPrintBase64DecodeBody: Bool = false, response: HTTPURLResponse?, data: Data?, error: Error?, requestDuration: TimeInterval?) -> (requestLog: String, responseLog: String) {
        
        var requestLog = ""
        var responseLog = ""
        
        if let response = response {
            
            requestLog = omPrintRequestLog(isPrintBase64DecodeBody: isPrintBase64DecodeBody, separator: [omResponseSeparator, omStatusCodeSeparator(statusCode: response.statusCode)])
            
            if let requestDuration = requestDuration {
                
                responseLog += "[Duration]\t\(requestDuration)"
            }
            
            if isPrintHeader, let header = Data.OM.JSONString(from: response.allHeaderFields) {
                
                responseLog += "\n[Header]\n\(header)"
            }
            
        } else {
            
            requestLog = omPrintRequestLog(isPrintBase64DecodeBody: isPrintBase64DecodeBody, separator: [omResponseSeparator, omStatusCodeSeparator()])
            
            if let requestDuration = requestDuration {
                
                responseLog += "[Duration]\t\(requestDuration)"
            }
        }
        
        if let error = error {
            
            responseLog += "\n[Error]\t\t\(error.localizedDescription)"
        }
        
        if let data = data {
            
            responseLog += "\n[Size]\t\t\(data)"
            
            if let data = data.omToJson() {
                
                responseLog += "\n[Data]\n\(data)"
                
                if let json = Data(base64Encoded: data, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)?.omToJson(), isPrintBase64DecodeBody {
                    
                    responseLog += "\n[Data -> Base64Decode]\n\(json)"
                }
            }
        }
        
        responseLog += omResponseSeparator
        print(responseLog)
        
        return (requestLog, responseLog)
    }
}
