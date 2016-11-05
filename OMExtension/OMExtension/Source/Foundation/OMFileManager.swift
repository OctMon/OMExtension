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
    
    /// 获取沙盒中的URL
    ///
    /// - Parameters:
    ///   - for: SearchPathDirectory
    ///   - path: e.g. "a/b/c/d.txt"
    /// - Returns: URL
    static func omGetURL(for: SearchPathDirectory, path: String? = nil) -> URL {
        
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
        
        return omGetURL(for: .documentDirectory, path: path)
    }
    
    /// 获取 cachesDirectory -> URL
    ///
    /// - Parameter path: e.g. "a/b/c/d.txt"
    /// - Returns: URL
    static func omCachesDirectory(path: String? = nil) -> URL {
        
        return omGetURL(for: .cachesDirectory, path: path)
    }
    
    /// 检查文件是否存在
    ///
    /// - Parameters:
    ///   - for: SearchPathDirectory
    ///   - path: "a/b/c/d.txt
    /// - Returns: 存在返回URL 不存在返回空nil
    static func omFileExists(for: SearchPathDirectory = .documentDirectory, path: String) -> URL? {
        
        let url = omGetURL(for: `for`, path: path)
        
        return omFileExists(at: url)
    }
    
    /// 检查文件是否存在
    ///
    /// - Parameter at: URL
    /// - Returns: 存在返回URL 不存在返回空nil
    static func omFileExists(at: URL) -> URL? {
        
        if FileManager.default.fileExists(atPath: at.path) {
            
            return at
        }
        
        return nil
    }
    
    /// 获取文件大小
    ///
    /// - Parameters:
    ///   - for: SearchPathDirectory
    ///   - path: e.g. "a/b/c/d.txt"
    /// - Returns: 存在返回大小 不存在返回空nil
    static func omFileSize(for: SearchPathDirectory = .documentDirectory, path: String) -> Int {
        
        let url = omGetURL(for: `for`, path: path)
        
        return omFileSize(at: url)
    }
    
    /// 获取文件大小
    ///
    /// - Parameter at: URL
    /// - Returns: 存在返回大小 不存在返回空nil
    static func omFileSize(at: URL) -> Int {
        
        do {
            return (try FileManager.default.attributesOfItem(atPath: at.path)[FileAttributeKey.size] as? Int) ?? 0
        } catch {
            return 0
        }
    }
    
    /// 创建目录
    ///
    /// - Parameters:
    ///   - for: SearchPathDirectory
    ///   - path: e.g. "a/b/c"
    static func omCreateDirectory(for: SearchPathDirectory = .documentDirectory, path: String) {
        
        let url = omGetURL(for: `for`, path: path)
        
        omCreateDirectory(at: url)
    }
    
    /// 创建目录
    ///
    /// - Parameter at: URL
    static func omCreateDirectory(at: URL) {
        
        if omFileExists(path: at.path) == nil {
            
            try? FileManager.default.createDirectory(at: at, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    /// 删除文件或目录
    ///
    /// - Parameters:
    ///   - for: SearchPathDirectory
    ///   - path: e.g. "a/b/c"
    static func omRemoveItem(for: SearchPathDirectory = .documentDirectory, path: String) {
        
        let url = omGetURL(for: `for`, path: path)
        
        omRemoveItem(at: url)
    }
    
    /// 删除文件或目录
    ///
    /// - Parameter at: URL
    static func omRemoveItem(at: URL) {
        
        try? FileManager.default.removeItem(at: at)
    }
}
