//
//  OMDevice.swift
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

#if !os(macOS) && !os(watchOS)

import UIKit

public extension UIDevice {
    
    struct OM {
        
        @available(*, deprecated, message: "Extensions directly deprecated. Use `UIDevice.OM.name` instead.", renamed: "hardwareString")
        /// 设备型号
        public static var name: String {
            
            return hardwareString
        }
        
        /// 设备型号 e.g. "iPhone2,1"
        public static var hardwareString: String {
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            return machineMirror.children.reduce("") { acc, element in
                guard let value = element.value as? Int8, value != 0 else {
                    return acc
                }
                return acc + String(UnicodeScalar(UInt8(value)))
            }
        }
        
        /// iPhone判断
        public static var isPhone: Bool { return UIDevice.current.userInterfaceIdiom == .phone }
        
        /// iPad判断
        public static var isPad: Bool { return UIDevice.current.userInterfaceIdiom == .pad }
        
        public static let iPhone5 = UIScreen.OM.width == 320
        public static let iPhone6 = UIScreen.OM.width == 375
        public static let iPhone6Plus = UIScreen.OM.width == 414
        public static let iPhoneX = UIScreen.OM.height == 812

        #if !os(tvOS)
        
        /// 前面的摄像头是否可用
        public static var isAvailableCameraFront: Bool { return UIImagePickerController.isCameraDeviceAvailable(.front) }
        
        /// 后面的摄像头是否可用
        public static var isAvailableCameraRear: Bool { return UIImagePickerController.isCameraDeviceAvailable(.rear) }
        
        #endif
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIDevice.OM.name` instead.", renamed: "OM.hardwareString")
    /// 设备型号
    static var omName: String {
        
        return OM.name
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIDevice.OM.isPhone` instead.", renamed: "OM.isPhone")
    /// iPhone判断
    static var omIsPhone: Bool { return OM.isPhone }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIDevice.OM.isPad` instead.", renamed: "OM.isPad")
    /// iPad判断
    static var omIsPad: Bool { return OM.isPad }
    #if !os(tvOS)
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIDevice.OM.isAvailableCameraFront` instead.", renamed: "OM.isAvailableCameraFront")
    /// 前面的摄像头是否可用
    static var omIsAvailableCameraFront: Bool { return OM.isAvailableCameraFront }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIDevice.OM.isAvailableCameraRear` instead.", renamed: "OM.isAvailableCameraRear")
    /// 后面的摄像头是否可用
    static var omIsAvailableCameraRear: Bool { return OM.isAvailableCameraRear }
    #endif
}

#endif
