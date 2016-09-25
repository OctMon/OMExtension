//
//  OMImage.swift
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

public extension UIImage {
    
    convenience init?(omQRcode: String) {
        
        self.init(omCodeGeneratorWithFilterName: "CIQRCodeGenerator", code: omQRcode)
    }
    
    convenience init?(omBarcode: String) {
        
        self.init(omCodeGeneratorWithFilterName: "CICode128BarcodeGenerator", code: omBarcode)
    }
    
    convenience init?(omCodeGeneratorWithFilterName: String, code: String) {
        
        let filter = CIFilter(name: omCodeGeneratorWithFilterName)
        filter?.setDefaults()
        
        let data = code.dataUsingEncoding(NSUTF8StringEncoding)
        filter?.setValue(data, forKey: "inputMessage")
        
        let outputImage = filter?.outputImage
        
        if outputImage != nil {
            
            let context = CIContext(options: nil)
            let cgImage = context.createCGImage(outputImage!, fromRect: (outputImage?.extent)!)
            
            #if swift(>=2.3)
                self.init(CGImage: cgImage!, scale: 1.0, orientation: UIImageOrientation.Up)
            #else
                self.init(CGImage: cgImage, scale: 1.0, orientation: UIImageOrientation.Up)
            #endif
            
        } else {
            
            self.init(named: "")
        }
    }
    
    convenience init?(omColor: UIColor, frame:CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) {
        
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context!, omColor.CGColor)
        CGContextFillRect(context!, frame)
        let cgImage = UIGraphicsGetImageFromCurrentImageContext()!.CGImage
        UIGraphicsEndImageContext()
        
        self.init(CGImage: cgImage!, scale: 1.0, orientation: UIImageOrientation.Up)
    }
    
    func omResize(size: CGSize, quality: CGInterpolationQuality = .None) -> UIImage {
        
        let resizedImage: UIImage
        
        UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height))
        let context = UIGraphicsGetCurrentContext()
        CGContextSetInterpolationQuality(context!, quality)
        drawInRect(CGRect(origin: CGPointZero, size: size))
        resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    func omTintColor(tintColor: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context!, 0, size.height)
        CGContextScaleCTM(context!, 1.0, -1.0)
        CGContextSetBlendMode(context!, CGBlendMode.Normal)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height) as CGRect
        CGContextClipToMask(context!, rect, CGImage!)
        tintColor.setFill()
        CGContextFillRect(context!, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    static func omLaunchImage() -> UIImage? {
        
        if let imagesDict = NSBundle.mainBundle().infoDictionary!["UILaunchImages"] as? [[String: String]] {
            
            for dict in imagesDict {
                
                if CGSizeEqualToSize(UIScreen.omGetSize, CGSizeFromString(dict["UILaunchImageSize"]!)) {
                    
                    return UIImage(named: dict["UILaunchImageName"]!)
                }
            }
            
            let launchImageName = (NSBundle.mainBundle().infoDictionary!["UILaunchImageFile"] ?? "") as? String
            
            if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
                
                if UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation) {
                    
                    return UIImage(named: launchImageName! + "-Portrait")
                }
                
                if UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation) {
                    
                    return UIImage(named: launchImageName! + "-Landscape")
                }
            }
            
            return UIImage(named: launchImageName ?? "")
        }
        
        return nil
    }
    
}
