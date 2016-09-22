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
import UIKit

// MARK: - common

public extension UIViewController {
    
    var omNavigationBar: UINavigationBar? {
        
        return navigationController?.navigationBar
    }
    
    func omPushViewController(viewController: UIViewController, animated: Bool = true) {
        
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func omPopViewController(animated: Bool = true) {
        
        navigationController?.popViewControllerAnimated(animated)
    }
    
    func omPresentViewController(viewController: UIViewController, animated: Bool = true, completion: dispatch_block_t? = nil) {
        
        presentViewController(viewController, animated: animated, completion: completion)
    }
    
    func omDismissViewController(animated: Bool = true, completion: dispatch_block_t? = nil) {
        
        dismissViewControllerAnimated(animated, completion: completion)
    }
    
    /**
     点击任意位置收回键盘
     */
    func omDismissKeyboardWhenTapped() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.omDismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    /**
     收回键盘
     */
    func omDismissKeyboard() {
        
        view.endEditing(true)
    }
    
    /**
     设置背景图
     
     - parameter image: 背景图
     
     - returns: UIImageView
     */
    func omSetBackground(image image: UIImage) -> UIImageView {
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        return imageView
    }
    
}

// MARK: - notification

public extension UIViewController {
    
    func omAddUserDidTakeScreenshotNotificationNotification(handler: dispatch_block_t) {
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationUserDidTakeScreenshotNotification, object: nil, queue: NSOperationQueue.mainQueue()) { notification in
            
            handler()
        }
    }
    
    /**
     添加通知
     
     - parameter name:     名称
     - parameter selector: 方法
     */
    func omAddNotificationObserver(name: String, selector: Selector) {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
    }
    
    /**
     删除通知
     
     - parameter name: 名称
     */
    func omRemoveNotificationObserver(name: String) {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
    }
    
    /**
     删除通知
     */
    func omRemoveNotificationObserver() {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func omAddKeyboardWillShowNotification() {
        
        omAddNotificationObserver(UIKeyboardWillShowNotification, selector: #selector(UIViewController.omKeyboardWillShowNotification(_:)))
    }
    
    func omAddKeyboardDidShowNotification() {
        
        omAddNotificationObserver(UIKeyboardDidShowNotification, selector: #selector(UIViewController.omKeyboardDidShowNotification(_:)))
    }
    
    func omAddKeyboardWillHideNotification() {
        
        omAddNotificationObserver(UIKeyboardWillHideNotification, selector: #selector(UIViewController.omKeyboardWillHideNotification(_:)))
    }
    
    func omAddKeyboardDidHideNotification() {
        
        omAddNotificationObserver(UIKeyboardDidHideNotification, selector: #selector(UIViewController.omKeyboardDidHideNotification(_:)))
    }
    
    func omRemoveKeyboardWillShowNotification() {
        
        omRemoveNotificationObserver(UIKeyboardWillShowNotification)
    }
    
    func omRemoveKeyboardDidShowNotification() {
        
        omRemoveNotificationObserver(UIKeyboardDidShowNotification)
    }
    
    func omRemoveKeyboardWillHideNotification() {
        
        omRemoveNotificationObserver(UIKeyboardWillHideNotification)
    }
    
    func omRemoveKeyboardDidHideNotification() {
        
        omRemoveNotificationObserver(UIKeyboardDidHideNotification)
    }
    
    func omKeyboardDidShowNotification(notification: NSNotification) {
        
        if let info = notification.userInfo, value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardDidShowWithFrame(value.CGRectValue())
        }
    }
    
    func omKeyboardWillShowNotification(notification: NSNotification) {
        
        if let info = notification.userInfo, value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardWillShowWithFrame(value.CGRectValue())
        }
    }
    
    func omKeyboardWillHideNotification(notification: NSNotification) {
        
        if let info = notification.userInfo, value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardWillHideWithFrame(value.CGRectValue())
        }
    }
    
    func omKeyboardDidHideNotification(notification: NSNotification) {
        
        if let info = notification.userInfo, value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardDidHideWithFrame(value.CGRectValue())
        }
    }
    
    func omKeyboardWillShowWithFrame(frame: CGRect) {
        
    }
    
    func omKeyboardDidShowWithFrame(frame: CGRect) {
        
    }
    
    func omKeyboardWillHideWithFrame(frame: CGRect) {
        
    }
    
    func omKeyboardDidHideWithFrame(frame: CGRect) {
        
    }
    
}

// MARK: - placeholder

private var __omPlaceholderView__: String = "__omPlaceholderView__"

private var __omPlaceholderImageView__: String = "__omPlaceholderImageView__"

private var __omPlaceholderTitleLabel__: String = "__omPlaceholderTitleLabel__"

private var __omPlaceholderDescriptionLabel__: String = "__omPlaceholderDescriptionLabel__"

private var __omPlaceholderButton__: String = "__omPlaceholderButton__"

public extension UIViewController {
    
    private var placeholderView: UIView? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderView__) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderView__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var placeholderImageView: UIImageView? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderImageView__) as? UIImageView
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderImageView__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var placeholderTitleLabel: UILabel? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderTitleLabel__) as? UILabel
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderTitleLabel__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var placeholderDescriptionLabel: UILabel? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderDescriptionLabel__) as? UILabel
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderDescriptionLabel__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var placeholderButton: UIButton? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderButton__) as? UIButton
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderButton__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private func omSetScrollEnabled(scrollEnabled: Bool) {
        
        view.subviews.forEach({ (subView) in
            
            if subView.isKindOfClass(UIScrollView.self){
                
                (subView as! UIScrollView).scrollEnabled = scrollEnabled
            }
        })
        
        if isKindOfClass(UITableViewController) {
            
            (self as! UITableViewController).tableView.scrollEnabled = scrollEnabled
        }
    }
    
    private func imageView(image: UIImage?, offset: CGFloat) {
        
        if placeholderImageView == nil {
            
            placeholderImageView = UIImageView(image: image)
            placeholderImageView?.contentMode = .Center
            
            placeholderView?.addSubview(placeholderImageView!)
            
            placeholderImageView?.center.x = placeholderView!.center.x
            placeholderImageView?.center.y = placeholderView!.center.y + offset
        }
    }
    
    private func titleLabel(attributedString: NSAttributedString?, space: CGFloat) {
        
        if placeholderTitleLabel == nil {
            
            placeholderTitleLabel = UILabel()
            
            guard let _titleLabel = placeholderTitleLabel else {
                
                return
            }
            
            _titleLabel.textColor = UIColor(omHex: 0xc9c9c9)
            _titleLabel.font = UIFont.systemFontOfSize(27)
            _titleLabel.attributedText = attributedString
            _titleLabel.numberOfLines = 0
            _titleLabel.textAlignment = .Center
            
            guard let _imageView = placeholderImageView else {
                
                return
            }
            
            guard let _view = placeholderView else {
                
                return
            }
            
            _titleLabel.sizeToFit()
            _titleLabel.frame.size.width = _view.frame.size.width - 30
            _titleLabel.frame.origin.y = _imageView.frame.origin.y + _imageView.frame.size.height + space
            
            let width2 = _titleLabel.textRectForBounds(CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.max), limitedToNumberOfLines: 2).height
            let width1 = _titleLabel.textRectForBounds(CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.max), limitedToNumberOfLines: 1).height
            
            if width2 > width1 {
                
                _titleLabel.sizeToFit()
            }
            
            _titleLabel.center.x = _imageView.center.x
            
            _view.addSubview(_titleLabel)
        }
    }
    
    private func descriptionlLabel(attributedString: NSAttributedString?, space: CGFloat) {
        
        if placeholderDescriptionLabel == nil {
            
            placeholderDescriptionLabel = UILabel()
            
            guard let _descriptionLabel = placeholderDescriptionLabel else {
                
                return
            }
            
            _descriptionLabel.textColor = UIColor(omHex: 0xcfcfcf)
            _descriptionLabel.font = UIFont.systemFontOfSize(17)
            _descriptionLabel.attributedText = attributedString
            _descriptionLabel.numberOfLines = 0
            _descriptionLabel.textAlignment = .Center
            
            guard let _titleLabel = placeholderTitleLabel else {
                
                return
            }
            
            guard let _view = placeholderView else {
                
                return
            }
            
            _descriptionLabel.sizeToFit()
            _descriptionLabel.frame.size.width = _view.frame.size.width - 30
            _descriptionLabel.frame.origin.y = _titleLabel.frame.origin.y + _titleLabel.frame.size.height + space
            
            let width2 = _descriptionLabel.textRectForBounds(CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.max), limitedToNumberOfLines: 2).height
            let width1 = _descriptionLabel.textRectForBounds(CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.max), limitedToNumberOfLines: 1).height
            
            if width2 > width1 {
                
                _descriptionLabel.sizeToFit()
            }
            
            _descriptionLabel.center.x = _titleLabel.center.x
            
            _view.addSubview(_descriptionLabel)
        }
    }
    
    private func button(backgroundImages: [(backgroundImage: UIImage?, state: UIControlState)]? = nil, titles: [(title: NSMutableAttributedString?, state: UIControlState)]? = nil, size: CGSize? = nil, space: CGFloat) {
        
        if placeholderButton == nil {
            
            placeholderButton = UIButton(type: .Custom)
            
            guard let _button = placeholderButton else {
                
                return
            }
            
            _button.titleLabel?.font = UIFont.systemFontOfSize(14.0)
            backgroundImages?.forEach({_button.setBackgroundImage($0.backgroundImage, forState: $0.state)})
            titles?.forEach({_button.setAttributedTitle($0.title, forState: $0.state)})
            
            guard let _descriptionLabel = placeholderDescriptionLabel else {
                
                return
            }
            
            guard let _view = placeholderView else {
                
                return
            }
            
            if let _size = size {
                
                _button.frame.size = _size
                
            } else {
                
                let size = _button.sizeThatFits(CGSize(width: UIScreen.omGetWidth - 30, height: UIScreen.omGetHeight))
                
                _button.frame.size = CGSize(width: min(size.width + 30, UIScreen.omGetWidth - 30), height: max(size.height, 30))
            }
            
            _button.frame.origin.y = _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + space
            _button.center.x = _descriptionLabel.center.x
            
            _view.addSubview(_button)
        }
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
    func omShowPlaceholder(image: UIImage? = nil, backgroundColor: UIColor = UIColor.clearColor(), titleAttributedString: NSMutableAttributedString? = nil, descriptionAttributedString: NSMutableAttributedString? = nil, space: CGFloat = 8, shouldTap: Bool = false, offset: CGFloat = 0, buttonBackgroundImages: [(backgroundImage: UIImage?, state: UIControlState)]? = nil, titles: [(title: NSMutableAttributedString?, state: UIControlState)]? = nil, size: CGSize? = nil, buttonTapHandler: ((button: UIButton)->Void)? = nil) {
        
        omHidePlaceholder()
        
        var offsetY = offset
        
        if let navigation = navigationController  {
            
            offsetY = navigation.navigationBar.translucent ? 0 : -64
            offsetY += offset
        }
        
        omSetScrollEnabled(shouldTap)
        
        placeholderView = UIView(frame: UIScreen.mainScreen().bounds)
        placeholderView?.backgroundColor = backgroundColor
        
        if shouldTap {
            
            view.insertSubview(placeholderView!, atIndex: 0)
            
        } else {
            
            view.addSubview(placeholderView!)
        }
        
        imageView(image, offset: offsetY)
        titleLabel(titleAttributedString, space: space)
        descriptionlLabel(descriptionAttributedString, space: space)
        button(buttonBackgroundImages, titles: titles, size: size, space: space)
        
        placeholderButton?.omAddTapGestureRecognizer(handler: { [weak self] (_) in
            
            if let button = self?.placeholderButton {
                
                buttonTapHandler?(button: button)
            }
            
        })
    }
    
    /**
     隐藏占位图
     */
    func omHidePlaceholder() {
        
        omSetScrollEnabled(true)
        
        if placeholderView != nil {
            
            placeholderImageView?.removeFromSuperview()
            placeholderTitleLabel?.removeFromSuperview()
            placeholderDescriptionLabel?.removeFromSuperview()
            placeholderButton?.removeFromSuperview()
            
            placeholderView!.removeFromSuperview()
            
            placeholderImageView = nil
            placeholderTitleLabel = nil
            placeholderDescriptionLabel = nil
            placeholderButton = nil
            
            placeholderView = nil
        }
    }
    
}
