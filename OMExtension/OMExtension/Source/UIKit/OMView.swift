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

public typealias OMTapGestureHandler = (tapGestureRecognizer: UITapGestureRecognizer) -> Void
public typealias OMLongPressGestureHandler = (longPressGestureRecognizer: UILongPressGestureRecognizer) -> Void
public typealias OMPanGestureHandler = (panGestureRecognizer: UIPanGestureRecognizer) -> Void
public typealias OMSwipeGestureHandler = (swipeGestureRecognizer: UISwipeGestureRecognizer) -> Void
public typealias OMPinchGestureHandler = (pinchGestureRecognizer: UIPinchGestureRecognizer) -> Void

public class OMTapGestureRecognizer: UITapGestureRecognizer {
    
    private var tapGestureHandler: OMTapGestureHandler!
    
    convenience init(numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, handler: OMTapGestureHandler) {
        self.init()
        
        self.numberOfTapsRequired = numberOfTapsRequired
        self.numberOfTouchesRequired = numberOfTouchesRequired
        
        
        tapGestureHandler = handler
        addTarget(self, action: #selector(OMTapGestureRecognizer.action(_:)))
    }
    
    @objc private func action(tapGestureRecognizer: UITapGestureRecognizer) {
        
        tapGestureHandler(tapGestureRecognizer: tapGestureRecognizer)
    }
    
}

public class OMLongPressGestureRecognizer: UILongPressGestureRecognizer {
    
    private var longPressGestureHandler: OMLongPressGestureHandler!
    
    convenience init(numberOfTapsRequired: Int = 0, numberOfTouchesRequired: Int = 1, handler: OMLongPressGestureHandler) {
        self.init()
        
        self.numberOfTapsRequired = numberOfTapsRequired
        self.numberOfTouchesRequired = numberOfTouchesRequired
        
        longPressGestureHandler = handler
        
        addTarget(self, action: #selector(OMLongPressGestureRecognizer.action(_:)))
    }
    
    @objc private func action(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        longPressGestureHandler(longPressGestureRecognizer: longPressGestureRecognizer)
    }
    
}

public class OMPanGestureRecognizer: UIPanGestureRecognizer {
    
    private var panGestureHandler: OMPanGestureHandler!
    
    convenience init(minimumNumberOfTouches: Int = 1, handler: OMPanGestureHandler) {
        self.init()
        
        self.minimumNumberOfTouches = minimumNumberOfTouches
        
        panGestureHandler = handler
        
        addTarget(self, action: #selector(OMPanGestureRecognizer.action(_:)))
    }
    
    @objc private func action(panGestureRecognizer: UIPanGestureRecognizer) {
        
        panGestureHandler(panGestureRecognizer: panGestureRecognizer)
    }
    
}

public class OMSwipeGestureRecognizer: UISwipeGestureRecognizer {
    
    private var swipeGestureHandler: OMSwipeGestureHandler!
    
    convenience init(direction: UISwipeGestureRecognizerDirection, numberOfTouchesRequired: Int = 1, handler: OMSwipeGestureHandler) {
        self.init()
        
        self.direction = direction
        self.numberOfTouchesRequired = numberOfTouchesRequired
        
        swipeGestureHandler = handler
        
        addTarget(self, action: #selector(OMSwipeGestureRecognizer.action(_:)))
    }
    
    @objc private func action(swipeGestureRecognizer: UISwipeGestureRecognizer) {
        
        swipeGestureHandler(swipeGestureRecognizer: swipeGestureRecognizer)
    }
    
}

public class OMPinchGestureRecognizer: UIPinchGestureRecognizer {
    
    private var pinchGestureHandler: OMPinchGestureHandler!
    
    convenience init(handler: OMPinchGestureHandler) {
        self.init()
        
        pinchGestureHandler = handler
        
        addTarget(self, action: #selector(OMPinchGestureRecognizer.action(_:)))
    }
    
    @objc private func action(pinchGestureRecognizer: UIPinchGestureRecognizer) {
        
        pinchGestureHandler(pinchGestureRecognizer: pinchGestureRecognizer)
    }

}

// MARK: - AddGestureRecognizer

public extension UIView {
    
    /**
     点按手势
     
     - parameter numberOfTapsRequired:    手势点击数
     - parameter numberOfTouchesRequired: 手指个数
     - parameter handler:                 回调
     
     - returns: OMTapGestureRecognizer
     */
    func omAddTapGestureRecognizer(numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, handler: OMTapGestureHandler) -> OMTapGestureRecognizer {
        
        userInteractionEnabled = true
        let tapGestureRecognizer = OMTapGestureRecognizer(numberOfTapsRequired: numberOfTapsRequired, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        addGestureRecognizer(tapGestureRecognizer)
        
        return tapGestureRecognizer
    }
    
    /**
     长按手势
     
     - parameter numberOfTapsRequired:    手势点击数
     - parameter numberOfTouchesRequired: 手指个数
     - parameter handler:                 回调
     
     - returns: OMLongPressGestureRecognizer
     */
    func omAddLongPressGestureRecognizer(numberOfTapsRequired: Int = 0, numberOfTouchesRequired: Int = 1, handler: OMLongPressGestureHandler) -> OMLongPressGestureRecognizer {
        
        userInteractionEnabled = true
        let longPressGestureRecognizer = OMLongPressGestureRecognizer(numberOfTapsRequired: numberOfTapsRequired, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        addGestureRecognizer(longPressGestureRecognizer)
        
        return longPressGestureRecognizer
    }
    
    /**
     拖动手势
     
     - parameter minimumNumberOfTouches: 最少手指个数
     - parameter handler:                回调
     
     - returns: OMPanGestureRecognizer
     */
    func omAddPanGestureRecognizer(minimumNumberOfTouches: Int = 1, handler: OMPanGestureHandler) -> OMPanGestureRecognizer {
        
        userInteractionEnabled = true
        let longPressGestureRecognizer = OMPanGestureRecognizer(minimumNumberOfTouches: minimumNumberOfTouches, handler: handler)
        addGestureRecognizer(longPressGestureRecognizer)
        
        return longPressGestureRecognizer
    }
    
    /**
     轻扫手势，支持四个方向的轻扫，但是不同的方向要分别定义轻扫手势
     
     - parameter direction:               方向
     - parameter numberOfTouchesRequired: 手指个数
     - parameter handler:                 回调
     
     - returns: OMSwipeGestureRecognizer
     */
    func omAddSwipeGestureRecognizer(direction: UISwipeGestureRecognizerDirection, numberOfTouchesRequired: Int = 1, handler: OMSwipeGestureHandler) -> OMSwipeGestureRecognizer {
        
        userInteractionEnabled = true
        let swpieGestureRecognizer = OMSwipeGestureRecognizer(direction: direction, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        addGestureRecognizer(swpieGestureRecognizer)
        
        return swpieGestureRecognizer
    }
    
    /**
     捏合手势
     
     - parameter handler: 回调
     
     - returns: OMPinchGestureHandler
     */
    func omAddPinchGestureRecognizer(handler: OMPinchGestureHandler) -> OMPinchGestureRecognizer {
        
        userInteractionEnabled = true
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
    
    func leftOffset(offset: CGFloat) -> CGFloat { return self.omX - offset }
    
    func rightOffset(offset: CGFloat) -> CGFloat { return self.omRight + offset }
    
    func topOffset(offset: CGFloat) -> CGFloat { return self.omTop - offset }
    
    func bottomOffset(offset: CGFloat) -> CGFloat { return self.omBottom + offset }

}

// MARK: - layer

public extension UIView {
    
    private static let lineColor = UIColor(omHex: 0xCCCCCC)
    private static let lineSize: CGFloat = 0.3
    
    func omRoundSquare() {
        
        clipsToBounds = true
        
        layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) * 0.5
    }
    
    func omRoundCorner(corner: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        
        layer.mask = mask
    }
    
    func omAddBorder(x x: CGFloat, y: CGFloat, width: CGFloat = 0.3, height: CGFloat = 0.3, color: UIColor = UIColor(omHex: 0xCCCCCC)) {
        
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: x, y: y, width: width, height: height)
        borderLayer.backgroundColor = color.CGColor
        
        layer.addSublayer(borderLayer)
    }
    
    func omAddBorder(size size: CGFloat = lineSize, color: UIColor = lineColor) {
        
        layer.borderWidth = size
        layer.borderColor = color.CGColor
        layer.masksToBounds = true
    }
    
    func omAddBorderTop(size size: CGFloat = lineSize, color: UIColor = lineColor, padding: (left: CGFloat , right: CGFloat) = (0, 0)) {
        
        omAddBorder(x: padding.0 + padding.1, y: 0, width: frame.width - padding.0 - padding.1, height: size, color: color)
    }
    
    func omAddBorderLeft(size size: CGFloat = lineSize, color: UIColor = lineColor) {
        
        omAddBorder(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    
    func omAddBorderBottom(size size: CGFloat = lineSize, color: UIColor = lineColor, padding: (left: CGFloat , right: CGFloat) = (0, 0)) {
        
        omAddBorder(x: padding.0 + padding.1, y: frame.height - size, width: frame.width - padding.0 - padding.1, height: size, color: color)
    }
    
    func omAddBorderRight(size size: CGFloat = lineSize, color: UIColor = lineColor) {
        
        omAddBorder(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
}

// MARK: - transform

public extension UIView {
    
    func omSetRotationX(x: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * x) / 180.0, 1.0, 0.0, 0.0)
        layer.transform = transform
    }
    
    func omSetRotationY(y: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * y) / 180.0, 0.0, 1.0, 0.0)
        layer.transform = transform
    }
    
    func omSetRotationZ(z: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * z) / 180.0, 0.0, 0.0, 1.0)
        layer.transform = transform
    }
    
    func omSetRotation(x x: CGFloat, y: CGFloat, z: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * x) / 180.0, 1.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * y) / 180.0, 0.0, 1.0, 0.0)
        transform = CATransform3DRotate(transform, (CGFloat (M_PI) * z) / 180.0, 0.0, 0.0, 1.0)
        layer.transform = transform
    }
    
    func omSetScale(x x: CGFloat, y: CGFloat) {
        
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
        shake.values = [NSValue(CATransform3D: CATransform3DMakeTranslation(-5.0, 0.0, 0.0)), NSValue(CATransform3D: CATransform3DMakeTranslation(5.0, 0.0, 0.0))]
        shake.autoreverses = true
        shake.repeatCount = 2.0
        shake.duration = 0.07
        
        layer.addAnimation(shake, forKey:"shake")
    }
    
    /**
     脉冲动画
     
     - parameter duration: 时间
     */
    func omPulseAnimationWithDuration(duration: CGFloat) {
        
        UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(1.1, 1.1)
        }) { (finished) -> Void in
            if finished {
                UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                    self.transform = CGAffineTransformMakeScale(0.96, 0.96)
                }) { (finished: Bool) -> Void in
                    if finished {
                        UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                            self.transform = CGAffineTransformMakeScale(1.03, 1.03)
                        }) { (finished: Bool) -> Void in
                            if finished {
                                UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                                    self.transform = CGAffineTransformMakeScale(0.985, 0.985)
                                }) { (finished: Bool) -> Void in
                                    if finished {
                                        UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                                            self.transform = CGAffineTransformMakeScale(1.007, 1.007)
                                        }) { (finished: Bool) -> Void in
                                            if finished {
                                                UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                                                    self.transform = CGAffineTransformMakeScale(1, 1)
                                                })
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /**
     心跳动画
     
     - parameter duration: 时间
     */
    func omHeartbeatAnimationWithDuration(duration: CGFloat) {
        
        let maxSize: CGFloat = 1.4, durationPerBeat: CGFloat = 0.5
        
        let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        
        let scale1: CATransform3D = CATransform3DMakeScale(0.8, 0.8, 1)
        let scale2: CATransform3D = CATransform3DMakeScale(maxSize, maxSize, 1)
        let scale3: CATransform3D = CATransform3DMakeScale(maxSize - 0.3, maxSize - 0.3, 1)
        let scale4: CATransform3D = CATransform3DMakeScale(1.0, 1.0, 1)
        
        let frameValues: Array = [NSValue(CATransform3D: scale1), NSValue(CATransform3D: scale2), NSValue(CATransform3D: scale3), NSValue(CATransform3D: scale4)]
        
        animation.values = frameValues
        
        let frameTimes: Array = [NSNumber(float: 0.05), NSNumber(float: 0.2), NSNumber(float: 0.6), NSNumber(float: 1.0)]
        animation.keyTimes = frameTimes
        
        animation.fillMode = kCAFillModeForwards
        animation.duration = NSTimeInterval(durationPerBeat)
        animation.repeatCount = Float(duration / durationPerBeat)
        
        layer.addAnimation(animation, forKey: "heartbeat")
    }

}

// MARK: - Screenshot

public extension UIView {
    
    /**
     截图
     
     - returns: UIImage
     */
    func omScreenshotToImage() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        
        drawViewHierarchyInRect(bounds, afterScreenUpdates: true)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imageData: NSData = UIImagePNGRepresentation(image)!
        image = UIImage(data: imageData)!
        
        return image
    }
    
    /**
     截图并保存到相册
     
     - returns: UIImage
     */
    func omScreenshotToSavedPhotosAlbum() -> UIImage {
        
        let image: UIImage = omScreenshotToImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        return image
    }

}
