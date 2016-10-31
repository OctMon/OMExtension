//
//  OMFileManager.swift
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

public extension FileManager {
    
    /// 获取 沙盒中的url
    ///
    /// - Parameters:
    ///   - for: SearchPathDirectory
    ///   - path: e.g. "a/b/c/d.txt"
    /// - Returns: URL
    static func omGetUrl(for: SearchPathDirectory, path: String? = nil) -> URL {
        
        var document = FileManager.default.urls(for: `for`, in: .userDomainMask)[0]
        
        if let path = path {
            
            document.appendPathComponent(path)
        }
        
        return document
    }
    
    /// 获取 documentDirectory -> URL
    ///
    /// - Parameter path: e.g. "a/b/c/d.txt"
    /// - Returns: URL
    static func omDocumentDirectory(path: String? = nil) -> URL {
        
        return omGetUrl(for: .documentDirectory, path: path)
    }
    
    /// 获取 cachesDirectory -> URL
    ///
    /// - Parameter path: e.g. "a/b/c/d.txt"
    /// - Returns: URL
    static func omCachesDirectory(path: String? = nil) -> URL {
        
        return omGetUrl(for: .cachesDirectory, path: path)
    }
    
    /// 检查 文件是否存在
    ///
    /// - Parameter path: e.g. "a/b/c/d.txt"
    /// - Returns: 存在返回URL 不存在返回空nil
    static func omFileExists(for: SearchPathDirectory = .documentDirectory, path: String) -> URL?{
        
        let url = omGetUrl(for: `for`, path: path)
        
        if FileManager.default.fileExists(atPath: url.path) {
            
            return url
        }
        
        return nil
    }
    
    /// 创建目录
    ///
    /// - Parameter path: path: e.g. "a/b/c"
    static func omCreateDirectory(for: SearchPathDirectory = .documentDirectory, path: String){
        
        let url = omGetUrl(for: `for`, path: path)
        
        if omFileExists(path: path) == nil {
            
            try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
