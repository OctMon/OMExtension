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

public extension OMExtension where OMBase: UIImage {
    
    func resize(size: CGSize, quality: CGInterpolationQuality = .none) -> UIImage {
        
        let resizedImage: UIImage
        
        UIGraphicsBeginImageContext(CGSize(width: size.width, height: size.height))
        let context = UIGraphicsGetCurrentContext()
        context!.interpolationQuality = quality
        base.draw(in: CGRect(origin: CGPoint.zero, size: size))
        resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    func setTintColor(tintColor: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(base.size, false, base.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: base.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: base.size.width, height: base.size.height) as CGRect
        context?.clip(to: rect, mask: base.cgImage!)
        tintColor.setFill()
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

public extension UIImage {
    
    struct OM {
        
        public static var launchImage: UIImage? {
            
            if let imagesDict = Bundle.main.infoDictionary!["UILaunchImages"] as? [[String: String]] {
                
                for dict in imagesDict {
                    
                    if UIScreen.OM.size.equalTo(CGSizeFromString(dict["UILaunchImageSize"]!)) {
                        
                        return UIImage(named: dict["UILaunchImageName"]!)
                    }
                }
                
                let launchImageName = (Bundle.main.infoDictionary!["UILaunchImageFile"] ?? "") as? String
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    
                    if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
                        
                        return UIImage(named: launchImageName! + "-Portrait")
                    }
                    
                    if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
                        
                        return UIImage(named: launchImageName! + "-Landscape")
                    }
                }
                
                return UIImage(named: launchImageName ?? "")
            }
            
            return nil
        }
    }
}

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
        
        let data = code.data(using: String.Encoding.utf8)
        filter?.setValue(data, forKey: "inputMessage")
        
        let outputImage = filter?.outputImage
        
        if let outputImage = outputImage {
            
            self.init(ciImage: outputImage)
            
        } else {
            
            self.init()
        }
    }
    
    convenience init?(omColor: UIColor, frame:CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) {
        
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(omColor.cgColor)
        context?.fill(frame)
        let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        
        self.init(cgImage: cgImage!, scale: 1.0, orientation: UIImageOrientation.up)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `image.om.resize` instead.", renamed: "om.resize")
    func omResize(_ size: CGSize, quality: CGInterpolationQuality = .none) -> UIImage {
        
        return om.resize(size: size, quality: quality)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `image.om.setTintColor` instead.", renamed: "om.setTintColor")
    func omTintColor(_ tintColor: UIColor) -> UIImage {
        
        return om.setTintColor(tintColor: tintColor)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIImage.OM.launchImage` instead.", renamed: "OM.launchImage")
    static func omLaunchImage() -> UIImage? {
        
        return OM.launchImage
    }
    
}
