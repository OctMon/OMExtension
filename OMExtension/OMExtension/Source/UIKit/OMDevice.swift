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
import UIKit

public extension UIDevice {
    
    /// 设备型号
    static var omName: String {
        
        var name: [Int32] = [CTL_HW, HW_MACHINE]
        var size: Int = 2
        sysctl(&name, 2, nil, &size, &name, 0)
        var hw_machine = [CChar](count: Int(size), repeatedValue: 0)
        sysctl(&name, 2, &hw_machine, &size, &name, 0)
        
        let hardware: String = String.fromCString(hw_machine)!
        
        return hardware
    }
    
    /// iPhone判断
    static var omIsPhone: Bool { return UIDevice.currentDevice().userInterfaceIdiom == .Phone }
    
    /// iPad判断
    static var omIsPad: Bool { return UIDevice.currentDevice().userInterfaceIdiom == .Pad }
    
    /// 前面的摄像头是否可用
    static var omIsAvailableCameraFront: Bool { return UIImagePickerController.isCameraDeviceAvailable(.Front) }
    
    /// 后面的摄像头是否可用
    static var omIsAvailableCameraRear: Bool { return UIImagePickerController.isCameraDeviceAvailable(.Rear) }
}
