//
//  OMView.swift
//  OMExtensionDemo
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

// MARK: - GestureHandler

public typealias OMTapGestureHandler = (UITapGestureRecognizer) -> Void
public typealias OMLongPressGestureHandler = (UILongPressGestureRecognizer) -> Void
public typealias OMPanGestureHandler = (UIPanGestureRecognizer) -> Void
public typealias OMSwipeGestureHandler = (UISwipeGestureRecognizer) -> Void
public typealias OMPinchGestureHandler = (UIPinchGestureRecognizer) -> Void

open class OMTapGestureRecognizer: UITapGestureRecognizer {
    
    fileprivate var tapGestureHandler: OMTapGestureHandler!
    
    convenience init(numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, handler: @escaping OMTapGestureHandler) {
        self.init()
        
        self.numberOfTapsRequired = numberOfTapsRequired
        self.numberOfTouchesRequired = numberOfTouchesRequired
        
        
        tapGestureHandler = handler
        addTarget(self, action: #selector(OMTapGestureRecognizer.action(_:)))
    }
    
    @objc fileprivate func action(_ tapGestureRecognizer: UITapGestureRecognizer) {
        
        tapGestureHandler(tapGestureRecognizer)
    }
    
}

open class OMLongPressGestureRecognizer: UILongPressGestureRecognizer {
    
    fileprivate var longPressGestureHandler: OMLongPressGestureHandler!
    
    convenience init(numberOfTapsRequired: Int = 0, numberOfTouchesRequired: Int = 1, handler: @escaping OMLongPressGestureHandler) {
        self.init()
        
        self.numberOfTapsRequired = numberOfTapsRequired
        self.numberOfTouchesRequired = numberOfTouchesRequired
        
        longPressGestureHandler = handler
        
        addTarget(self, action: #selector(OMLongPressGestureRecognizer.action(_:)))
    }
    
    @objc fileprivate func action(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        longPressGestureHandler(longPressGestureRecognizer)
    }
    
}

open class OMPanGestureRecognizer: UIPanGestureRecognizer {
    
    fileprivate var panGestureHandler: OMPanGestureHandler!
    
    convenience init(minimumNumberOfTouches: Int = 1, handler: @escaping OMPanGestureHandler) {
        self.init()
        
        self.minimumNumberOfTouches = minimumNumberOfTouches
        
        panGestureHandler = handler
        
        addTarget(self, action: #selector(OMPanGestureRecognizer.action(_:)))
    }
    
    @objc fileprivate func action(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        panGestureHandler(panGestureRecognizer)
    }
    
}

open class OMSwipeGestureRecognizer: UISwipeGestureRecognizer {
    
    fileprivate var swipeGestureHandler: OMSwipeGestureHandler!
    
    convenience init(direction: UISwipeGestureRecognizerDirection, numberOfTouchesRequired: Int = 1, handler: @escaping OMSwipeGestureHandler) {
        self.init()
        
        self.direction = direction
        self.numberOfTouchesRequired = numberOfTouchesRequired
        
        swipeGestureHandler = handler
        
        addTarget(self, action: #selector(OMSwipeGestureRecognizer.action(_:)))
    }
    
    @objc fileprivate func action(_ swipeGestureRecognizer: UISwipeGestureRecognizer) {
        
        swipeGestureHandler(swipeGestureRecognizer)
    }
    
}

open class OMPinchGestureRecognizer: UIPinchGestureRecognizer {
    
    fileprivate var pinchGestureHandler: OMPinchGestureHandler!
    
    convenience init(handler: @escaping OMPinchGestureHandler) {
        self.init()
        
        pinchGestureHandler = handler
        
        addTarget(self, action: #selector(OMPinchGestureRecognizer.action(_:)))
    }
    
    @objc fileprivate func action(_ pinchGestureRecognizer: UIPinchGestureRecognizer) {
        
        pinchGestureHandler(pinchGestureRecognizer)
    }

}

// MARK: - AddGestureRecognizer

public extension UIView {
    
    /**
     点按手势
     
     - parameter numberOfTapsRequired:    手势点击数
     - parameter numberOfTouchesRequired: 手指个数
     - parameter handler:                 使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMTapGestureRecognizer
     */
    @discardableResult
    func omAddTapGestureRecognizer(_ numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, handler: @escaping OMTapGestureHandler) -> OMTapGestureRecognizer {
        
        isUserInteractionEnabled = true
        let tapGestureRecognizer = OMTapGestureRecognizer(numberOfTapsRequired: numberOfTapsRequired, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        addGestureRecognizer(tapGestureRecognizer)
        
        return tapGestureRecognizer
    }
    
    /**
     长按手势
     
     - parameter numberOfTapsRequired:    手势点击数
     - parameter numberOfTouchesRequired: 手指个数
     - parameter handler:                 使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMLongPressGestureRecognizer
     */
    @discardableResult
    func omAddLongPressGestureRecognizer(_ numberOfTapsRequired: Int = 0, numberOfTouchesRequired: Int = 1, handler: @escaping OMLongPressGestureHandler) -> OMLongPressGestureRecognizer {
        
        isUserInteractionEnabled = true
        let longPressGestureRecognizer = OMLongPressGestureRecognizer(numberOfTapsRequired: numberOfTapsRequired, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        addGestureRecognizer(longPressGestureRecognizer)
        
        return longPressGestureRecognizer
    }
    
    /**
     拖动手势
     
     - parameter minimumNumberOfTouches: 最少手指个数
     - parameter handler:                使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMPanGestureRecognizer
     */
    @discardableResult
    func omAddPanGestureRecognizer(_ minimumNumberOfTouches: Int = 1, handler: @escaping OMPanGestureHandler) -> OMPanGestureRecognizer {
        
        isUserInteractionEnabled = true
        let longPressGestureRecognizer = OMPanGestureRecognizer(minimumNumberOfTouches: minimumNumberOfTouches, handler: handler)
        addGestureRecognizer(longPressGestureRecognizer)
        
        return longPressGestureRecognizer
    }
    
    /**
     轻扫手势，支持四个方向的轻扫，但是不同的方向要分别定义轻扫手势
     
     - parameter direction:               方向
     - parameter numberOfTouchesRequired: 手指个数
     - parameter handler:                 使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMSwipeGestureRecognizer
     */
    @discardableResult
    func omAddSwipeGestureRecognizer(_ direction: UISwipeGestureRecognizerDirection, numberOfTouchesRequired: Int = 1, handler: @escaping OMSwipeGestureHandler) -> OMSwipeGestureRecognizer {
        
        isUserInteractionEnabled = true
        let swpieGestureRecognizer = OMSwipeGestureRecognizer(direction: direction, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        addGestureRecognizer(swpieGestureRecognizer)
        
        return swpieGestureRecognizer
    }
    
    /**
     捏合手势
     
     - parameter handler: 使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMPinchGestureHandler
     */
    @discardableResult
    func omAddPinchGestureRecognizer(_ handler: @escaping OMPinchGestureHandler) -> OMPinchGestureRecognizer {
        
        isUserInteractionEnabled = true
        let pinchGestureRecognizer = OMPinchGestureRecognizer(handler: handler)
        addGestureRecognizer(pinchGestureRecognizer)
        
        return pinchGestureRecognizer
    }

}

// MARK: - frame

public extension UIView {
    
    convenience init(omX x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: width, height: height))
    }
    
    var omX: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.omY, width: self.omW, height: self.omH)
        }
    }
    
    var omY: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.omX, y: value, width: self.omW, height: self.omH)
        }
    }
    
    var omW: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.omX, y: self.omY, width: value, height: self.omH)
        }
    }
    
    var omH: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.omX, y: self.omY, width: self.omW, height: value)
        }
    }
    
    var omLeft: CGFloat {
        get {
            return self.omX
        } set(value) {
            self.omX = value
        }
    }
    
    var omRight: CGFloat {
        get {
            return self.omX + self.omW
        } set(value) {
            self.omX = value - self.omW
        }
    }
    
    var omTop: CGFloat {
        get {
            return self.omY
        } set(value) {
            self.omY = value
        }
    }
    
    var omBottom: CGFloat {
        get {
            return self.omY + self.omH
        } set(value) {
            self.omY = value - self.omH
        }
    }
    
    var omCenterX: CGFloat {
        get {
            return self.center.x
        } set(value) {
            self.center.x = value
        }
    }
    
    var omCenterY: CGFloat {
        get {
            return self.center.y
        } set(value) {
            self.center.y = value
        }
    }
    
    var omOrigin: CGPoint {
        get {
            return self.frame.origin
        } set(value) {
            self.frame = CGRect(origin: value, size: self.frame.size)
        }
    }
    
    var omSize: CGSize {
        get {
            return self.frame.size
        } set(value) {
            self.frame = CGRect(origin: self.frame.origin, size: value)
        }
    }
    
    @discardableResult
    func leftOffset(_ offset: CGFloat) -> CGFloat { return self.omX - offset }
    
    @discardableResult
    func rightOffset(_ offset: CGFloat) -> CGFloat { return self.omRight + offset }
    
    @discardableResult
    func topOffset(_ offset: CGFloat) -> CGFloat { return self.omTop - offset }
    
    @discardableResult
    func bottomOffset(_ offset: CGFloat) -> CGFloat { return self.omBottom + offset }

}

// MARK: - layer

public extension UIView {
    
    fileprivate static let lineColor = UIColor(omHex: 0xCCCCCC)
    fileprivate static let lineSize: CGFloat = 0.3
    
    func omRoundSquare() {
        
        clipsToBounds = true
        
        layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) * 0.5
    }
    
    func omRoundCorner(_ corner: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        layer.mask = mask
    }
    
    func omAddBorder(x: CGFloat, y: CGFloat, width: CGFloat = 0.3, height: CGFloat = 0.3, color: UIColor = UIColor(omHex: 0xCCCCCC)) {
        
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: x, y: y, width: width, height: height)
        borderLayer.backgroundColor = color.cgColor
        
        layer.addSublayer(borderLayer)
    }
    
    func omAddBorder(size: CGFloat = lineSize, color: UIColor = lineColor) {
        
        layer.borderWidth = size
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    
    func omAddBorderTop(size: CGFloat = lineSize, color: UIColor = lineColor, padding: (left: CGFloat , right: CGFloat) = (0, 0)) {
        
        omAddBorder(x: padding.0 + padding.1, y: 0, width: frame.width - padding.0 - padding.1, height: size, color: color)
    }
    
    func omAddBorderLeft(size: CGFloat = lineSize, color: UIColor = lineColor) {
        
        omAddBorder(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    
    func omAddBorderBottom(size: CGFloat = lineSize, color: UIColor = lineColor, padding: (left: CGFloat , right: CGFloat) = (0, 0)) {
        
        omAddBorder(x: padding.0 + padding.1, y: frame.height - size, width: frame.width - padding.0 - padding.1, height: size, color: color)
    }
    
    func omAddBorderRight(size: CGFloat = lineSize, color: UIColor = lineColor) {
        
        omAddBorder(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
}

// MARK: - transform

public extension UIView {
    
    func omSetRotationX(_ x: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * x) / 180.0, 1.0, 0.0, 0.0)
        layer.transform = transform
    }
    
    func omSetRotationY(_ y: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * y) / 180.0, 0.0, 1.0, 0.0)
        layer.transform = transform
    }
    
    func omSetRotationZ(_ z: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * z) / 180.0, 0.0, 0.0, 1.0)
        layer.transform = transform
    }
    
    func omSetRotation(x: CGFloat, y: CGFloat, z: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * x) / 180.0, 1.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * y) / 180.0, 0.0, 1.0, 0.0)
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * z) / 180.0, 0.0, 0.0, 1.0)
        layer.transform = transform
    }
    
    func omSetScale(x: CGFloat, y: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DScale(transform, x, y, 1)
        layer.transform = transform
    }

}

// MARK: - animation

public extension UIView {
    
    /**
     摇一摇动画
     */
    func omShakeAnimation() {
        
        let shake: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        shake.values = [NSValue(caTransform3D: CATransform3DMakeTranslation(-5.0, 0.0, 0.0)), NSValue(caTransform3D: CATransform3DMakeTranslation(5.0, 0.0, 0.0))]
        shake.autoreverses = true
        shake.repeatCount = 2.0
        shake.duration = 0.07
        
        layer.add(shake, forKey:"shake")
    }
    
    /**
     脉冲动画
     
     - parameter duration: 时间
     */
    func omPulseAnimationWithDuration(_ duration: CGFloat) {
        
        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { (finished) -> Void in
            if finished {
                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                    self.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
                }, completion: { (finished: Bool) -> Void in
                    if finished {
                        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                            self.transform = CGAffineTransform(scaleX: 1.03, y: 1.03)
                        }, completion: { (finished: Bool) -> Void in
                            if finished {
                                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                    self.transform = CGAffineTransform(scaleX: 0.985, y: 0.985)
                                }, completion: { (finished: Bool) -> Void in
                                    if finished {
                                        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                            self.transform = CGAffineTransform(scaleX: 1.007, y: 1.007)
                                        }, completion: { (finished: Bool) -> Void in
                                            if finished {
                                                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                                                })
                                            }
                                        }) 
                                    }
                                }) 
                            }
                        }) 
                    }
                }) 
            }
        }) 
    }
    
    /**
     心跳动画
     
     - parameter duration: 时间
     */
    func omHeartbeatAnimationWithDuration(_ duration: CGFloat) {
        
        let maxSize: CGFloat = 1.4, durationPerBeat: CGFloat = 0.5
        
        let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        
        let scale1: CATransform3D = CATransform3DMakeScale(0.8, 0.8, 1)
        let scale2: CATransform3D = CATransform3DMakeScale(maxSize, maxSize, 1)
        let scale3: CATransform3D = CATransform3DMakeScale(maxSize - 0.3, maxSize - 0.3, 1)
        let scale4: CATransform3D = CATransform3DMakeScale(1.0, 1.0, 1)
        
        let frameValues: Array = [NSValue(caTransform3D: scale1), NSValue(caTransform3D: scale2), NSValue(caTransform3D: scale3), NSValue(caTransform3D: scale4)]
        
        animation.values = frameValues
        
        let frameTimes: Array = [NSNumber(value: 0.05 as Float), NSNumber(value: 0.2 as Float), NSNumber(value: 0.6 as Float), NSNumber(value: 1.0 as Float)]
        animation.keyTimes = frameTimes
        
        animation.fillMode = kCAFillModeForwards
        animation.duration = TimeInterval(durationPerBeat)
        animation.repeatCount = Float(duration / durationPerBeat)
        
        layer.add(animation, forKey: "heartbeat")
    }

}

// MARK: - Screenshot

public extension UIView {
    
    /**
     截图
     
     - returns: UIImage
     */
    func omScreenshotToImage() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imageData: Data = UIImagePNGRepresentation(image)!
        image = UIImage(data: imageData)!
        
        return image
    }
    
    /**
     截图并保存到相册
     
     - returns: UIImage
     */
    @discardableResult
    func omScreenshotToSavedPhotosAlbum() -> UIImage {
        
        let image: UIImage = omScreenshotToImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        return image
    }

}
