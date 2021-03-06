//
//  OMViewController.swift
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

// MARK: - common

public extension OMExtension where OMBase: UIViewController {
    
    var navigationBar: UINavigationBar? {
        
        return base.navigationController?.navigationBar
    }
    
    #if !os(tvOS)
    
    func setBackBarButtonItem(title: String? = nil) {
        
        let temporaryBarButtonItem = UIBarButtonItem()
        temporaryBarButtonItem.title = title ?? ""
        base.navigationItem.backBarButtonItem = temporaryBarButtonItem
    }
    
    #endif
    
    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        
        base.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    @discardableResult
    func popViewController(animated: Bool = true) -> UIViewController? {
        
        return base.navigationController?.popViewController(animated: animated)
    }
    
    func presentViewController(_ viewController: UIViewController, animated: Bool = true, completion: (()->())? = nil) {
        
        base.present(viewController, animated: animated, completion: completion)
    }
    
    func dismissViewController(animated: Bool = true, completion: (()->())? = nil) {
        
        base.dismiss(animated: animated, completion: completion)
    }
    
    /**
     点击任意位置收回键盘
     */
    func hideKeyboardwhenTapped() {
        
        base.hideKeyboardwhenTapped()
    }
    
    /**
     收回键盘
     */
    func hideKeyboard() {
        
        base.hideKeyboard()
    }
    
    /**
     设置背景图
     
     - parameter image: 背景图
     
     - returns: UIImageView
     */
    @discardableResult
    func setBackgroundImage(_ image: UIImage?) -> UIImageView {
        
        let imageView = UIImageView(frame: base.view.frame)
        imageView.image = image
        base.view.addSubview(imageView)
        base.view.sendSubview(toBack: imageView)
        
        return imageView
    }
    
    /// 添加系统截屏通知
    ///
    /// - Parameter handler: 截屏回调
    func addUserDidTakeScreenshotNotification(handler: @escaping ()->()) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil, queue: OperationQueue.main) { notification in
            
            handler()
        }
    }
}

public extension UIViewController {
    
    fileprivate func hideKeyboardwhenTapped() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func hideKeyboard() {
        
        view.endEditing(true)
    }
}

// MARK: - placeholder

public extension OMExtension where OMBase: UIViewController {
    
    var placeholderView: UIView? {
        
        return base.omPlaceholderView
    }
    
    var placeholderImageView: UIImageView? {
        
        return base.omPlaceholderImageView
    }
    
    var placeholderTitleLabel: UILabel? {
        
        return base.omPlaceholderTitleLabel
    }
    
    var placeholderDescriptionLabel: UILabel? {
        
        return base.omPlaceholderDescriptionLabel
    }
    
    var placeholderButton: UIButton? {
        
        return base.omPlaceholderButton
    }
    
    var isShowPlaceholder: Bool {
        
        return base.isShowPlaceholder
    }
    
    /**
     显示占位图
     
     - parameter image:                       图片
     - parameter backgroundColor:             背景色
     - parameter titleAttributedString:       标题
     - parameter descriptionAttributedString: 描述
     - parameter space:                       间距
     - parameter shouldTapBackground:         是否可以交互
     - parameter offset:                      距离y坐标偏移
     */
    func showPlaceholder(image: UIImage? = nil, backgroundColor: UIColor = UIColor.clear, titleAttributedString: NSMutableAttributedString? = nil, descriptionAttributedString: NSMutableAttributedString? = nil, space: CGFloat = 8, shouldTap: Bool = false, offset: CGFloat = 0, bringSubviews: [UIView]? = nil, buttonBackgroundImages: [(backgroundImage: UIImage?, state: UIControlState)]? = nil, buttonTitles: [(title: NSMutableAttributedString?, state: UIControlState)]? = nil, buttonSize: CGSize? = nil, buttonTapHandler: ((_ button: UIButton) -> Void)? = nil, placeholderViewTapHandler: (() -> Void)? = nil) {
        
        base.showPlaceholder(image, backgroundColor: backgroundColor, titleAttributedString: titleAttributedString, descriptionAttributedString: descriptionAttributedString, space: space, shouldTap: shouldTap, offset: offset, bringSubviews: bringSubviews, buttonBackgroundImages: buttonBackgroundImages, buttonTitles: buttonTitles, buttonSize: buttonSize, buttonTapHandler: buttonTapHandler, placeholderViewTapHandler: placeholderViewTapHandler)
    }
    
    /**
     隐藏占位图
     */
    func hidePlaceholder() {
        
        base.hidePlaceholder()
    }
}

private var _omPlaceholderView: Void?

private var _omPlaceholderImageView: Void?

private var _omPlaceholderTitleLabel: Void?

private var _omPlaceholderDescriptionLabel: Void?

private var _omPlaceholderButton: Void?

private var _omPlaceholderLastBackgroundColor: Void?

public extension UIViewController {
    
    fileprivate var omPlaceholderView: UIView? {
        
        get {
            return objc_getAssociatedObject(self, &_omPlaceholderView) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &_omPlaceholderView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var omPlaceholderImageView: UIImageView? {
        
        get {
            return objc_getAssociatedObject(self, &_omPlaceholderImageView) as? UIImageView
        }
        
        set {
            objc_setAssociatedObject(self, &_omPlaceholderImageView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var omPlaceholderTitleLabel: UILabel? {
        
        get {
            return objc_getAssociatedObject(self, &_omPlaceholderTitleLabel) as? UILabel
        }
        
        set {
            objc_setAssociatedObject(self, &_omPlaceholderTitleLabel, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var omPlaceholderDescriptionLabel: UILabel? {
        
        get {
            return objc_getAssociatedObject(self, &_omPlaceholderDescriptionLabel) as? UILabel
        }
        
        set {
            objc_setAssociatedObject(self, &_omPlaceholderDescriptionLabel, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var omPlaceholderButton: UIButton? {
        
        get {
            return objc_getAssociatedObject(self, &_omPlaceholderButton) as? UIButton
        }
        
        set {
            objc_setAssociatedObject(self, &_omPlaceholderButton, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var omPlaceholderLastBackgroundColor: UIColor? {
        
        get {
            return objc_getAssociatedObject(self, &_omPlaceholderLastBackgroundColor) as? UIColor
        }
        
        set {
            objc_setAssociatedObject(self, &_omPlaceholderLastBackgroundColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func omSetScrollEnabled(_ scrollEnabled: Bool) {
        
        view.subviews.forEach({ (subView) in
            
            if subView.isKind(of: UIScrollView.self){
                
                (subView as! UIScrollView).isScrollEnabled = scrollEnabled
            }
        })
        
        if isKind(of: UITableViewController.self) {
            
            (self as! UITableViewController).tableView.isScrollEnabled = scrollEnabled
        }
    }
    
    private func imageView(_ image: UIImage?, offset: CGFloat) {
        
        if omPlaceholderImageView == nil {
            
            omPlaceholderImageView = UIImageView(image: image)
            
            guard let _imageView = omPlaceholderImageView else {
                
                return
            }
            
            _imageView.contentMode = .center
            
            view.addSubview(_imageView)
            
            updateFrame(offset: offset)
        }
    }
    
    private func titleLabel(_ attributedString: NSAttributedString?, offset: CGFloat, space: CGFloat) {
        
        if omPlaceholderTitleLabel == nil {
            
            omPlaceholderTitleLabel = UILabel()
            
            guard let _titleLabel = omPlaceholderTitleLabel else {
                
                return
            }
            
            _titleLabel.textColor = UIColor(omHex: 0xc9c9c9)
            _titleLabel.font = UIFont.systemFont(ofSize: 27)
            _titleLabel.attributedText = attributedString
            _titleLabel.numberOfLines = 0
            _titleLabel.textAlignment = .center
            
            view.addSubview(_titleLabel)
            
            updateFrame(offset: offset, space: space)
        }
    }
    
    private func descriptionlLabel(_ attributedString: NSAttributedString?, offset: CGFloat, space: CGFloat) {
        
        if omPlaceholderDescriptionLabel == nil {
            
            omPlaceholderDescriptionLabel = UILabel()
            
            guard let _descriptionLabel = omPlaceholderDescriptionLabel else {
                
                return
            }
            
            _descriptionLabel.textColor = UIColor(omHex: 0xcfcfcf)
            _descriptionLabel.font = UIFont.systemFont(ofSize: 17)
            _descriptionLabel.attributedText = attributedString
            _descriptionLabel.numberOfLines = 0
            _descriptionLabel.textAlignment = .center
            
            view.addSubview(_descriptionLabel)
            
            updateFrame(offset: offset, space: space)
        }
    }
    
    private func button(_ backgroundImages: [(backgroundImage: UIImage?, state: UIControlState)]? = nil, titles: [(title: NSMutableAttributedString?, state: UIControlState)]? = nil, size: CGSize? = nil, offset: CGFloat, space: CGFloat) {
        
        if omPlaceholderButton == nil {
            
            omPlaceholderButton = UIButton(type: .custom)
            
            guard let _button = omPlaceholderButton else {
                
                return
            }
            
            _button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            backgroundImages?.forEach({_button.setBackgroundImage($0.backgroundImage, for: $0.state)})
            titles?.forEach({_button.setAttributedTitle($0.title, for: $0.state)})
            
            view.addSubview(_button)
            
            updateFrame(offset: offset, space: space, buttonSize: size)
        }
    }
    
    private func updateFrame(offset: CGFloat, space: CGFloat = 8, buttonSize: CGSize? = nil) {
        
        guard let _view = omPlaceholderView else {
            
            return
        }
        
        guard let _imageView = omPlaceholderImageView else {
            
            return
        }
        
        _view.frame = view.frame
        
        if view.frame.origin.x >= UIScreen.OM.size.width {
            _view.frame.origin.x = 0
        }
        if view.frame.origin.y >= UIScreen.OM.size.height {
            _view.frame.origin.y = 0
        }
        
        _imageView.center.x = _view.center.x
        _imageView.center.y = _view.center.y + offset
        
        guard let _titleLabel = omPlaceholderTitleLabel else {
            
            return
        }
        
        _titleLabel.sizeToFit()
        _titleLabel.frame.size.width = _view.frame.size.width - 30
        _titleLabel.frame.origin.y = _imageView.frame.origin.y + _imageView.frame.size.height + space
        
        let _titleLabelwidth2 = _titleLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 2).height
        let _titleLabelwidth1 = _titleLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 1).height
        
        if _titleLabelwidth2 > _titleLabelwidth1 {
            
            _titleLabel.sizeToFit()
        }
        
        _titleLabel.center.x = _imageView.center.x
        
        guard let _descriptionLabel = omPlaceholderDescriptionLabel else {
            
            return
        }
        
        _descriptionLabel.sizeToFit()
        _descriptionLabel.frame.size.width = _view.frame.size.width - 30
        _descriptionLabel.frame.origin.y = _titleLabel.frame.origin.y + _titleLabel.frame.size.height + space
        
        let _descriptionLabelwidth2 = _descriptionLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 2).height
        let _descriptionLabelwidth1 = _descriptionLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 1).height
        
        if _descriptionLabelwidth2 > _descriptionLabelwidth1 {
            
            _descriptionLabel.sizeToFit()
        }
        
        _descriptionLabel.center.x = _titleLabel.center.x
        
        guard let _button = omPlaceholderButton else {
            
            return
        }
        
        if let _size = buttonSize {
            
            _button.frame.size = _size
            
        } else {
            
            let size = _button.sizeThatFits(CGSize(width: UIScreen.OM.width - 30, height: UIScreen.OM.height))
            
            _button.frame.size = CGSize(width: min(size.width + 30, UIScreen.OM.width - 30), height: max(size.height, 30))
        }
        
        if let text = _descriptionLabel.text, !text.isEmpty {
            _button.frame.origin.y = _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + space
        } else {
            _button.frame.origin.y = _titleLabel.frame.origin.y + _titleLabel.frame.size.height + space
        }
        
        _button.center.x = _descriptionLabel.center.x
    }
    
    fileprivate var isShowPlaceholder: Bool {
        
        return omPlaceholderView != nil
    }
    
    /**
     显示占位图
     
     - parameter image:                       图片
     - parameter backgroundColor:             背景色
     - parameter titleAttributedString:       标题
     - parameter descriptionAttributedString: 描述
     - parameter space:                       间距
     - parameter shouldTapBackground:         是否可以交互
     - parameter offset:                      距离y坐标偏移
     */
    fileprivate func showPlaceholder(_ image: UIImage? = nil, backgroundColor: UIColor, titleAttributedString: NSMutableAttributedString? = nil, descriptionAttributedString: NSMutableAttributedString? = nil, space: CGFloat = 8, shouldTap: Bool = false, offset: CGFloat = 0, bringSubviews: [UIView]? = nil, buttonBackgroundImages: [(backgroundImage: UIImage?, state: UIControlState)]? = nil, buttonTitles: [(title: NSMutableAttributedString?, state: UIControlState)]? = nil, buttonSize: CGSize? = nil, buttonTapHandler: ((_ button: UIButton) -> Void)? = nil, placeholderViewTapHandler: (() -> Void)? = nil) {
        
        omPlaceholderLastBackgroundColor = view.backgroundColor
        
        hidePlaceholder()
        
        var offsetY = offset
        
        if let navigation = navigationController  {
            
            offsetY = navigation.navigationBar.isTranslucent ? 0 : -64
            offsetY += offset
        }
        
        // 如果要阻止tableview可以滑动，shouldTap必须为false
        omSetScrollEnabled(shouldTap)
        
        omPlaceholderView = UIView(frame: UIScreen.main.bounds)
        omPlaceholderView?.backgroundColor = backgroundColor
        
        if backgroundColor != UIColor.clear {
            
            view.backgroundColor = backgroundColor
        }
        
        imageView(image, offset: offsetY)
        titleLabel(titleAttributedString, offset: offset, space: space)
        descriptionlLabel(descriptionAttributedString, offset: offset, space: space)
        button(buttonBackgroundImages, titles: buttonTitles, size: buttonSize, offset: offset, space: space)
        
        if let p = omPlaceholderView {
            p.frame = CGRect(x: 0, y: 0, width: UIScreen.OM.width, height: UIScreen.OM.height)
            view.insertSubview(p, at: 0)
        }
        
        view.bringSubview(toFront: om.placeholderView!)
        
        view.bringSubview(toFront: om.placeholderButton!)
        view.bringSubview(toFront: om.placeholderImageView!)
        view.bringSubview(toFront: om.placeholderTitleLabel!)
        view.bringSubview(toFront: om.placeholderDescriptionLabel!)
        
        bringSubviews?.forEach({ view.bringSubview(toFront: $0) })
        
        #if !os(tvOS)
            
            omPlaceholderButton?.om.addTapGestureRecognizer(handler: { [weak self] (_) in
                
                if let button = self?.omPlaceholderButton {
                    
                    buttonTapHandler?(button)
                }
                
            })
            
            if placeholderViewTapHandler != nil {
                
                omPlaceholderView?.backgroundColor = backgroundColor
                omPlaceholderView?.isUserInteractionEnabled = true
                omPlaceholderView?.om.addTapGestureRecognizer(handler: { (_) in
                    placeholderViewTapHandler?()
                })
                
            } else {
                
                omPlaceholderView?.isUserInteractionEnabled = false
            }
            
            if #available(iOS 9, *) {
                
            } else {
                NotificationCenter.default.addObserver(forName: NSNotification.Name.UIDeviceOrientationDidChange, object: nil, queue: OperationQueue.main) { [weak self] (notification) in
                    
                    self?.updateFrame(offset: offset, space: space, buttonSize: buttonSize)
                }
            }
            
        #endif
    }
    
    /**
     隐藏占位图
     */
    fileprivate func hidePlaceholder() {
        
        omSetScrollEnabled(true)
        
        if omPlaceholderView != nil {
            
            view.backgroundColor = omPlaceholderLastBackgroundColor
            
            omPlaceholderImageView?.removeFromSuperview()
            omPlaceholderTitleLabel?.removeFromSuperview()
            omPlaceholderDescriptionLabel?.removeFromSuperview()
            omPlaceholderButton?.removeFromSuperview()
            
            omPlaceholderView!.removeFromSuperview()
            
            omPlaceholderImageView = nil
            omPlaceholderTitleLabel = nil
            omPlaceholderDescriptionLabel = nil
            omPlaceholderButton = nil
            
            omPlaceholderView = nil
        }
    }
    
}
    
#endif
