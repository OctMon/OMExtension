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

public extension NSFileManager {
    
    /// 获取沙盒中的URL
    ///
    /// - Parameters:
    ///   - for: NSSearchPathDirectory
    ///   - path: e.g. "a/b/c/d.txt"
    /// - Returns: URL
    static func omGetURL(for: NSSearchPathDirectory, path: String? = nil) -> NSURL {
        
        var document = NSFileManager.defaultManager().URLsForDirectory(`for`, inDomains: .UserDomainMask)[0]
        
        if let path = path {
            
            if let documentAppend = document.URLByAppendingPathComponent(path) {
                
                document = documentAppend
            }
        }
        
        return document
    }
    
    /// 获取 documentDirectory -> URL
    ///
    /// - Parameter path: e.g. "a/b/c/d.txt"
    /// - Returns: NSURL
    static func omDocumentDirectory(path: String? = nil) -> NSURL {
        
        return omGetURL(.DocumentDirectory, path: path)
    }
    
    /// 获取 cachesDirectory -> URL
    ///
    /// - Parameter path: e.g. "a/b/c/d.txt"
    /// - Returns: NSURL
    static func omCachesDirectory(path: String? = nil) -> NSURL {
        
        return omGetURL(.CachesDirectory, path: path)
    }
    
    /// 检查文件是否存在
    ///
    /// - Parameters:
    ///   - for: NSSearchPathDirectory
    ///   - path: "a/b/c/d.txt
    /// - Returns: 存在返回NSURL 不存在返回空nil
    static func omFileExists(for: NSSearchPathDirectory = .DocumentDirectory, path: String) -> NSURL? {
        
        let url = omGetURL(`for`, path: path)
        
        return omFileExists(url)
    }
    
    /// 检查文件是否存在
    ///
    /// - Parameter at: NSURL
    /// - Returns: 存在返回NSURL 不存在返回空nil
    static func omFileExists(at: NSURL) -> NSURL? {
        
        if NSFileManager.defaultManager().fileExistsAtPath(at.path ?? "") {
            
            return at
        }
        
        return nil
    }
    
    /// 获取文件大小
    ///
    /// - Parameters:
    ///   - for: NSSearchPathDirectory
    ///   - path: e.g. "a/b/c/d.txt"
    /// - Returns: 存在返回大小 不存在返回空nil
    static func omFileSize(for: NSSearchPathDirectory = .DocumentDirectory, path: String) -> Int {
        
        let url = omGetURL(`for`, path: path)
        
        return omFileSize(url)
    }
    
    /// 获取文件大小
    ///
    /// - Parameter at: NSURL
    /// - Returns: 存在返回大小 不存在返回空nil
    static func omFileSize(at: NSURL) -> Int {
        
        if let size = try? (NSFileManager.defaultManager().attributesOfItemAtPath(at.path ?? ""))[NSFileSize] {
            
            return size as? Int ?? 0
        }
        
        return 0
    }
    
    /// 创建目录
    ///
    /// - Parameters:
    ///   - for: NSSearchPathDirectory
    ///   - path: e.g. "a/b/c"
    static func omCreateDirectory(for: NSSearchPathDirectory = .DocumentDirectory, path: String) {
        
        let url = omGetURL(`for`, path: path)
        
        omCreateDirectory(url)
    }
    
    /// 创建目录
    ///
    /// - Parameter at: NSURL
    static func omCreateDirectory(at: NSURL) {
        
        if omFileExists(path: at.path ?? "") == nil {
            
            let _ = try? NSFileManager.defaultManager().createDirectoryAtURL(at, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    /// 删除文件或目录
    ///
    /// - Parameters:
    ///   - for: NSSearchPathDirectory
    ///   - path: e.g. "a/b/c"
    static func omRemoveItem(for: NSSearchPathDirectory = .DocumentDirectory, path: String) {
        
        let url = omGetURL(`for`, path: path)
        
        omRemoveItem(url)
    }
    
    /// 删除文件或目录
    ///
    /// - Parameter at: NSURL
    static func omRemoveItem(at: NSURL) {
        
        let _ = try? NSFileManager.defaultManager().removeItemAtURL(at)
    }
}
