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

#if !os(macOS) && !os(watchOS)

import UIKit
    
#if !os(tvOS)

// MARK: - GestureHandler

public typealias OMTapGestureHandler = (UITapGestureRecognizer) -> Void
public typealias OMLongPressGestureHandler = (UILongPressGestureRecognizer) -> Void
public typealias OMPanGestureHandler = (UIPanGestureRecognizer) -> Void
public typealias OMSwipeGestureHandler = (UISwipeGestureRecognizer) -> Void
public typealias OMPinchGestureHandler = (UIPinchGestureRecognizer) -> Void

open class OMTapGestureRecognizer: UITapGestureRecognizer {
    
    fileprivate var tapGestureHandler: OMTapGestureHandler!
    
    @objc convenience init(numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, handler: @escaping OMTapGestureHandler) {
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
    
    @objc convenience init(numberOfTapsRequired: Int = 0, numberOfTouchesRequired: Int = 1, handler: @escaping OMLongPressGestureHandler) {
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
    
    @objc convenience init(minimumNumberOfTouches: Int = 1, handler: @escaping OMPanGestureHandler) {
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
    
    @objc convenience init(direction: UISwipeGestureRecognizerDirection, numberOfTouchesRequired: Int = 1, handler: @escaping OMSwipeGestureHandler) {
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
    
    @objc convenience init(handler: @escaping OMPinchGestureHandler) {
        self.init()
        
        pinchGestureHandler = handler
        
        addTarget(self, action: #selector(OMPinchGestureRecognizer.action(_:)))
    }
    
    @objc fileprivate func action(_ pinchGestureRecognizer: UIPinchGestureRecognizer) {
        
        pinchGestureHandler(pinchGestureRecognizer)
    }

}

// MARK: - gestureRecognizer

public extension OMExtension where OMBase: UIView {
    
    /**
     点按手势
     
     - parameter numberOfTapsRequired:    手势点击数
     - parameter numberOfTouchesRequired: 手指个数
     - parameter handler:                 使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMTapGestureRecognizer
     */
    @discardableResult
    func addTapGestureRecognizer(_ numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, handler: @escaping OMTapGestureHandler) -> OMTapGestureRecognizer {
        
        base.isUserInteractionEnabled = true
        let tapGestureRecognizer = OMTapGestureRecognizer(numberOfTapsRequired: numberOfTapsRequired, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        base.addGestureRecognizer(tapGestureRecognizer)
        
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
    func addLongPressGestureRecognizer(_ numberOfTapsRequired: Int = 0, numberOfTouchesRequired: Int = 1, handler: @escaping OMLongPressGestureHandler) -> OMLongPressGestureRecognizer {
        
        base.isUserInteractionEnabled = true
        let longPressGestureRecognizer = OMLongPressGestureRecognizer(numberOfTapsRequired: numberOfTapsRequired, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        base.addGestureRecognizer(longPressGestureRecognizer)
        
        return longPressGestureRecognizer
    }
    
    /**
     拖动手势
     
     - parameter minimumNumberOfTouches: 最少手指个数
     - parameter handler:                使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMPanGestureRecognizer
     */
    @discardableResult
    func addPanGestureRecognizer(_ minimumNumberOfTouches: Int = 1, handler: @escaping OMPanGestureHandler) -> OMPanGestureRecognizer {
        
        base.isUserInteractionEnabled = true
        let longPressGestureRecognizer = OMPanGestureRecognizer(minimumNumberOfTouches: minimumNumberOfTouches, handler: handler)
        base.addGestureRecognizer(longPressGestureRecognizer)
        
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
    func addSwipeGestureRecognizer(_ direction: UISwipeGestureRecognizerDirection, numberOfTouchesRequired: Int = 1, handler: @escaping OMSwipeGestureHandler) -> OMSwipeGestureRecognizer {
        
        base.isUserInteractionEnabled = true
        let swpieGestureRecognizer = OMSwipeGestureRecognizer(direction: direction, numberOfTouchesRequired: numberOfTouchesRequired, handler: handler)
        base.addGestureRecognizer(swpieGestureRecognizer)
        
        return swpieGestureRecognizer
    }
    
    /**
     捏合手势
     
     - parameter handler: 使用 [unowned self] 或 [weak self] 避免循环引用
     
     - returns: OMPinchGestureHandler
     */
    @discardableResult
    func addPinchGestureRecognizer(_ handler: @escaping OMPinchGestureHandler) -> OMPinchGestureRecognizer {
        
        base.isUserInteractionEnabled = true
        let pinchGestureRecognizer = OMPinchGestureRecognizer(handler: handler)
        base.addGestureRecognizer(pinchGestureRecognizer)
        
        return pinchGestureRecognizer
    }
}
   
#endif

// MARK: - frame

public extension OMExtension where OMBase: UIView {
    
    var x: CGFloat {
        
        get { return self.base.frame.origin.x }
        
        set(value) { self.base.frame.origin.x = value }
    }
    
    var y: CGFloat {
        
        get { return self.base.frame.origin.y }
        
        set(value) { self.base.frame.origin.y = value }
    }
    
    var width: CGFloat {
        
        get { return self.base.frame.size.width }
        
        set(value) { self.base.frame.size.width = value }
    }
    
    var height: CGFloat {
        
        get { return self.base.frame.size.height }
        
        set(value) { self.base.frame.size.height = value }
    }
    
    var left: CGFloat {
        
        get { return self.base.frame.origin.x }
        
        set(value) { self.base.frame.origin.x = value }
    }
    
    var right: CGFloat {
        
        get { return self.base.frame.origin.x + self.base.frame.size.width }
        
        set(value) { self.base.frame.origin.x = value - self.base.frame.size.width }
    }
    
    var top: CGFloat {
        
        get { return self.base.frame.origin.y }
        
        set(value) { self.base.frame.origin.y = value }
    }
    
    var bottom: CGFloat {
        
        get { return self.base.frame.origin.y + self.base.frame.size.height }
        
        set(value) { self.base.frame.origin.y = value - self.base.frame.size.height }
    }
    
    var centerX: CGFloat {
        
        get { return self.base.center.x }
        
        set(value) { self.base.center.x = value }
    }
    
    var centerY: CGFloat {
        
        get { return self.base.center.y }
        
        set(value) { self.base.center.y = value }
    }
    
    var origin: CGPoint {
        
        get { return self.base.frame.origin }
        
        set(value) { self.base.frame.origin = value }
    }
    
    var size: CGSize {
        
        get { return self.base.frame.size }
        
        set(value) { self.base.frame.size = value }
    }
    
    func leftOffset(_ to: CGFloat) -> CGFloat {
        
        self.base.frame.origin.x = self.base.frame.origin.x + to
        
        return x
    }
    
    func rightOffset(_ to: CGFloat) -> CGFloat {
        
        self.base.frame.origin.x = self.base.frame.origin.x + self.base.frame.size.width + to
        
        return x
    }
    
    func topOffset(_ to: CGFloat) -> CGFloat {
        
        self.base.frame.origin.y = self.base.frame.origin.y + to
        
        return y
    }
    
    func bottomOffset(_ to: CGFloat) -> CGFloat {
        
        self.base.frame.origin.y = self.base.frame.origin.y + self.base.frame.size.height + to
        
        return y
    }
}
    
// MARK: - layer

public extension OMExtension where OMBase: UIView {
    
    static var lineColor: UIColor { return UIColor(omHex: 0xCCCCCC) }
    static var lineSize: CGFloat { return 0.3 }
    
    func addRoundedCorners(cornerRadius: CGFloat? = nil) {
        
        base.clipsToBounds = true
        
        if let cornerRadius = cornerRadius {
            
            base.layer.cornerRadius = cornerRadius
            
        } else {
            
            base.layer.cornerRadius = min(self.base.frame.size.height, self.base.frame.size.width) * 0.5
        }
    }
    
    func addRoundedCorners(byRoundingCorners corners: UIRectCorner, cornerRadii: CGFloat) {
        
        let path = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        base.layer.mask = mask
    }
    
    func addBorder(size: CGFloat = lineSize, color: UIColor = lineColor) {
        
        base.layer.borderWidth = size
        base.layer.borderColor = color.cgColor
        base.layer.masksToBounds = true
    }
    
    @discardableResult
    func addBorder(x: CGFloat, y: CGFloat, width: CGFloat = 0.3, height: CGFloat = 0.3, color: UIColor = UIColor(omHex: 0xCCCCCC)) -> CALayer {
        
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: x, y: y, width: width, height: height)
        borderLayer.backgroundColor = color.cgColor
        
        base.layer.addSublayer(borderLayer)
        
        return borderLayer
    }
    
    @discardableResult
    func addBorderTop(size: CGFloat = lineSize, color: UIColor = lineColor, padding: (left: CGFloat , right: CGFloat) = (0, 0)) -> CALayer {
        
        return addBorder(x: padding.0 + padding.1, y: 0, width: base.frame.width - padding.0 - padding.1, height: size, color: color)
    }
    
    @discardableResult
    func addBorderLeft(size: CGFloat = lineSize, color: UIColor = lineColor) -> CALayer {
        
        return addBorder(x: 0, y: 0, width: size, height: base.frame.height, color: color)
    }
    
    @discardableResult
    func addBorderBottom(size: CGFloat = lineSize, color: UIColor = lineColor, padding: (left: CGFloat , right: CGFloat) = (0, 0)) -> CALayer {
        
        return addBorder(x: padding.0 + padding.1, y: base.frame.height - size, width: base.frame.width - padding.0 - padding.1, height: size, color: color)
    }
    
    @discardableResult
    func addBorderRight(size: CGFloat = lineSize, color: UIColor = lineColor) -> CALayer {
        
        return addBorder(x: base.frame.width - size, y: 0, width: size, height: base.frame.height, color: color)
    }
    
    func addShadow(offset: CGSize = CGSize(width: 5, height: 5), opacity: Float = 0.7, radius: CGFloat = 5, color: UIColor = lineColor) {
        
        base.layer.shadowOffset = offset
        base.layer.shadowOpacity = opacity
        base.layer.shadowRadius = radius
        base.layer.shadowColor = color.cgColor
    }
    
    func addContentsImage(_ image: UIImage?, contentsGravity: String = kCAGravityResize) {
        
        base.layer.contents = image?.cgImage
        base.layer.contentsGravity = contentsGravity
        base.layer.masksToBounds = true
    }
}

// MARK: - transform

public extension OMExtension where OMBase: UIView {
    
    func transform3DRotationX(_ angle: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (Double.pi) * angle) / 180.0, 1.0, 0.0, 0.0)
        base.layer.transform = transform
    }
    
    func transform3DRotationY(_ angle: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (Double.pi) * angle) / 180.0, 0.0, 1.0, 0.0)
        base.layer.transform = transform
    }
    
    func transform3DRotationZ(_ angle: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (Double.pi) * angle) / 180.0, 0.0, 0.0, 1.0)
        base.layer.transform = transform
    }
    
    func transform3DRotation(x: CGFloat, y: CGFloat, z: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, (CGFloat (Double.pi) * x) / 180.0, 1.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, (CGFloat (Double.pi) * y) / 180.0, 0.0, 1.0, 0.0)
        transform = CATransform3DRotate(transform, (CGFloat (Double.pi) * z) / 180.0, 0.0, 0.0, 1.0)
        base.layer.transform = transform
    }
    
    func transform3DScale(x: CGFloat, y: CGFloat) {
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DScale(transform, x, y, 1)
        base.layer.transform = transform
    }
}

// MARK: - animation

public extension OMExtension where OMBase: UIView {
    
    /**
     摇一摇动画
     */
    func animationShake() {
        
        let shake: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        shake.values = [NSValue(caTransform3D: CATransform3DMakeTranslation(-5.0, 0.0, 0.0)), NSValue(caTransform3D: CATransform3DMakeTranslation(5.0, 0.0, 0.0))]
        shake.autoreverses = true
        shake.repeatCount = 2.0
        shake.duration = 0.07
        
        base.layer.add(shake, forKey:"shake")
    }
    
    /**
     脉冲动画
     
     - parameter duration: 时间
     */
    func animationPulse(_ duration: CGFloat) {
        
        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
            self.base.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { (finished) -> Void in
            if finished {
                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                    self.base.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
                }, completion: { (finished: Bool) -> Void in
                    if finished {
                        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                            self.base.transform = CGAffineTransform(scaleX: 1.03, y: 1.03)
                        }, completion: { (finished: Bool) -> Void in
                            if finished {
                                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                    self.base.transform = CGAffineTransform(scaleX: 0.985, y: 0.985)
                                }, completion: { (finished: Bool) -> Void in
                                    if finished {
                                        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                            self.base.transform = CGAffineTransform(scaleX: 1.007, y: 1.007)
                                        }, completion: { (finished: Bool) -> Void in
                                            if finished {
                                                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                                    self.base.transform = CGAffineTransform(scaleX: 1, y: 1)
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
    func animationHeartbeat(_ duration: CGFloat) {
        
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
        
        base.layer.add(animation, forKey: "heartbeat")
    }
    
}

// MARK: - screenshot

public extension OMExtension where OMBase: UIView {
    
    /**
     截图
     
     - returns: UIImage
     */
    func getScreenshot() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(base.bounds.size, false, UIScreen.main.scale)
        
        base.drawHierarchy(in: base.bounds, afterScreenUpdates: true)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imageData: Data = UIImagePNGRepresentation(image)!
        image = UIImage(data: imageData)!
        
        return image
    }
    
    #if !os(tvOS)
    
    /**
     截图并保存到相册
     
     - returns: UIImage
     */
    @discardableResult
    func savedScreenshotPhotosAlbum() -> UIImage {
        
        let image: UIImage = getScreenshot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        return image
    }
    
    #endif
}

public enum OMGradientColorDirection: String {
    
    case topToBottom = "0001"
    case leftToRight = "0010"
    case bottomToTop = "0100"
    case rightToLeft = "1000"
    
    case leftTopToRightBottom = "0011"
    case rightTopToLeftBottom = "1001"
    case leftBottomToRightTop = "0110"
    case rightBottomToLeftTop = "1100"
}

// MARK: - gradient color

public extension OMExtension where OMBase: UIView {
    
    /// 计算起点与终点
    ///
    /// - Parameters:
    ///   - gradientLayer: 图层
    ///   - direction: 方向
    fileprivate func startAndEndPoint(gradientLayer: CAGradientLayer, direction: OMGradientColorDirection) {
        
        let str = direction.rawValue
        
        gradientLayer.startPoint = CGPoint(x: Int(str[str.index(str.startIndex, offsetBy: 0)..<str.index(str.endIndex, offsetBy: -3)]) ?? 0, y: Int(str[str.index(str.startIndex, offsetBy: 1)..<str.index(str.endIndex, offsetBy: -2)]) ?? 0)
        gradientLayer.endPoint = CGPoint(x: Int(str[str.index(str.startIndex, offsetBy: 2)..<str.index(str.endIndex, offsetBy: -1)]) ?? 0, y: Int(str[str.index(str.endIndex, offsetBy: -1)..<str.index(str.endIndex, offsetBy: 0)]) ?? 0)
    }
    
    /// 透明度渐变
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - fromAlpha: 开始透明度 [default = 0
    ///   - toAlpha: 结束透明度 [defualt = 1]
    ///   - direction: 方向 [default = .topToBottom]
    func addGradientColor(_ color: UIColor, fromAlpha: CGFloat = 0, toAlpha: CGFloat = 1, direction: OMGradientColorDirection = .topToBottom) {
        
        var fromAlpha = fromAlpha
        fromAlpha = max(0, fromAlpha)
        
        var toAlpha = toAlpha
        toAlpha = min(1, toAlpha)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color.withAlphaComponent(fromAlpha).cgColor, color.withAlphaComponent(toAlpha).cgColor]
        base.layoutIfNeeded()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: base.bounds.width, height: base.bounds.height)
        startAndEndPoint(gradientLayer: gradientLayer, direction: direction)
        base.layer.addSublayer(gradientLayer)
    }
    
    /// 颜色渐变
    ///
    /// - Parameters:
    ///   - colors: 颜色
    ///   - direction: 方向 [default = .topToBottom]
    func addGradientColors(_ colors: [UIColor], direction: OMGradientColorDirection = .topToBottom) {
        
        addGradientColors(colors.map({ ($0, 1) }), direction: direction)
    }
    
    /// 颜色渐变
    ///
    /// - Parameters:
    ///   - colors: (颜色, 透明度)
    ///   - direction: 方向 [default = .topToBottom]
    func addGradientColors(_ colors: [(color: UIColor, alpha: CGFloat)], direction: OMGradientColorDirection = .topToBottom) {
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = colors.map({ $0.color.withAlphaComponent($0.alpha).cgColor })
        base.layoutIfNeeded()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: base.bounds.width, height: base.bounds.height)
        startAndEndPoint(gradientLayer: gradientLayer, direction: direction)
        base.layer.addSublayer(gradientLayer)
    }
}

// MARK: - Class

public extension UIView {
    
    
    /// 快速实例化一个xib e.g.let test = TestView.omInstantiateFromNib() as! TestView
    ///
    /// - Returns: view
    @objc static func omInstantiateFromNib() -> UIView {
        
        guard let nib = Bundle.main.loadNibNamed(omClassName, owner: nil, options: nil) else {
            
            return UIView()
        }
        
        guard let instantiate = nib.first as? UIView else {
            
            return UIView()
        }
        
        return instantiate
    }
}

#endif
