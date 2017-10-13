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

#if !os(macOS)
    import UIKit
#endif

public extension FileManager {
    
    struct OM {
        
        /// 获取沙盒中的URL
        ///
        /// - Parameters:
        ///   - for: SearchPathDirectory
        ///   - path: e.g. "a/b/c/d.txt"
        /// - Returns: URL
        public static func getURL(for: SearchPathDirectory, path: String? = nil) -> URL {
            
            var url = FileManager.default.urls(for: `for`, in: .userDomainMask)[0]
            
            if let path = path {
                
                url.appendPathComponent(path)
            }
            
            return url
        }
        
        /// 获取 documentDirectory -> URL
        ///
        /// - Parameter path: e.g. "a/b/c/d.txt"
        /// - Returns: URL
        public static func getDocument(path: String? = nil) -> URL {
            
            return getURL(for: .documentDirectory, path: path)
        }
        
        /// 获取 cachesDirectory -> URL
        ///
        /// - Parameter path: e.g. "a/b/c/d.txt"
        /// - Returns: URL
        public static func getCaches(path: String? = nil) -> URL {
            
            return getURL(for: .cachesDirectory, path: path)
        }
        
        /// 检查文件是否存在
        ///
        /// - Parameters:
        ///   - for: SearchPathDirectory
        ///   - path: "a/b/c/d.txt
        /// - Returns: 存在返回URL 不存在返回空nil
        public static func fileExists(for: SearchPathDirectory = .documentDirectory, path: String) -> URL? {
            
            let url = getURL(for: `for`, path: path)
            
            return fileExists(at: url)
        }
        
        /// 检查文件是否存在
        ///
        /// - Parameter at: URL
        /// - Returns: 存在返回URL 不存在返回空nil
        public static func fileExists(at: URL) -> URL? {
            
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
        public static func getFileSize(for: SearchPathDirectory = .documentDirectory, path: String) -> Int {
            
            let url = getURL(for: `for`, path: path)
            
            return getFileSize(at: url)
        }
        
        /// 获取文件大小
        ///
        /// - Parameter at: URL
        /// - Returns: 存在返回大小 不存在返回空nil
        public static func getFileSize(at: URL) -> Int {
            
            do {
                return (try FileManager.default.attributesOfItem(atPath: at.path)[FileAttributeKey.size] as? Int) ?? 0
            } catch {
                return -1
            }
        }
        
        /// 获取磁盘空闲空间大小
        public static var getDiskFreeSpace: Int {
            
            guard let attrs = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) else { return -1 }
            
            guard let space = attrs.index(forKey: .systemFreeSize) else { return -1 }
            
            guard let freeSpace = attrs.values[space] as? Int else { return -1 }
            
            return freeSpace
        }
        
        /// 获取磁盘空闲空间大小
        public static var getDiskFreeSpaceString: String {
            
            let size = CGFloat(getDiskFreeSpace)
            
            let sizeUnit: CGFloat = 1024.0
            
            if size < sizeUnit { // B
                
                return String(format: "%lldB", size)
                
            } else if size < sizeUnit * sizeUnit {  // KB
                
                return String(format: "%.1fKB", size / sizeUnit)
                
            } else if size < sizeUnit * sizeUnit * sizeUnit {   // MB
                
                return String(format: "%.1fMB", size / (sizeUnit * sizeUnit))
                
            } else { // GB
                
                return String(format: "%.1fG", size / (sizeUnit * sizeUnit * sizeUnit))
            }
        }
        
        /// 创建目录
        ///
        /// - Parameters:
        ///   - for: SearchPathDirectory
        ///   - path: e.g. "a/b/c"
        public static func createDirectory(for: SearchPathDirectory = .documentDirectory, path: String) {
            
            let url = getURL(for: `for`, path: path)
            
            createDirectory(at: url)
        }
        
        /// 创建目录
        ///
        /// - Parameter at: URL
        public static func createDirectory(at: URL) {
            
            if fileExists(path: at.path) == nil {
                
                try? FileManager.default.createDirectory(at: at, withIntermediateDirectories: true, attributes: nil)
            }
        }
        
        /// 删除文件或目录
        ///
        /// - Parameters:
        ///   - for: SearchPathDirectory
        ///   - path: e.g. "a/b/c"
        public static func removeItem(for: SearchPathDirectory = .documentDirectory, path: String) {
            
            let url = getURL(for: `for`, path: path)
            
            removeItem(at: url)
        }
        
        /// 删除文件或目录
        ///
        /// - Parameter at: URL
        public static func removeItem(at: URL) {
            
            try? FileManager.default.removeItem(at: at)
        }
    }
}
