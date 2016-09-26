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
    
    func omPushViewController(_ viewController: UIViewController, animated: Bool = true) {
        
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    @discardableResult
    func omPopViewController(_ animated: Bool = true) -> UIViewController? {
        
        return navigationController?.popViewController(animated: animated)
    }
    
    func omPresentViewController(_ viewController: UIViewController, animated: Bool = true, completion: (()->())? = nil) {
        
        present(viewController, animated: animated, completion: completion)
    }
    
    func omDismissViewController(_ animated: Bool = true, completion: (()->())? = nil) {
        
        dismiss(animated: animated, completion: completion)
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
    @discardableResult
    func omSetBackground(image: UIImage) -> UIImageView {
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubview(toBack: imageView)
        
        return imageView
    }
    
}

// MARK: - notification

public extension UIViewController {
    
    func omAddUserDidTakeScreenshotNotificationNotification(_ handler: @escaping ()->()) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil, queue: OperationQueue.main) { notification in
            
            handler()
        }
    }
    
    /**
     添加通知
     
     - parameter name:     名称
     - parameter selector: 方法
     */
    func omAddNotificationObserver(_ name: String, selector: Selector) {
        
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    /**
     删除通知
     
     - parameter name: 名称
     */
    func omRemoveNotificationObserver(_ name: String) {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    /**
     删除通知
     */
    func omRemoveNotificationObserver() {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    func omAddKeyboardWillShowNotification() {
        
        omAddNotificationObserver(NSNotification.Name.UIKeyboardWillShow.rawValue, selector: #selector(UIViewController.omKeyboardWillShowNotification(_:)))
    }
    
    func omAddKeyboardDidShowNotification() {
        
        omAddNotificationObserver(NSNotification.Name.UIKeyboardDidShow.rawValue, selector: #selector(UIViewController.omKeyboardDidShowNotification(_:)))
    }
    
    func omAddKeyboardWillHideNotification() {
        
        omAddNotificationObserver(NSNotification.Name.UIKeyboardWillHide.rawValue, selector: #selector(UIViewController.omKeyboardWillHideNotification(_:)))
    }
    
    func omAddKeyboardDidHideNotification() {
        
        omAddNotificationObserver(NSNotification.Name.UIKeyboardDidHide.rawValue, selector: #selector(UIViewController.omKeyboardDidHideNotification(_:)))
    }
    
    func omRemoveKeyboardWillShowNotification() {
        
        omRemoveNotificationObserver(NSNotification.Name.UIKeyboardWillShow.rawValue)
    }
    
    func omRemoveKeyboardDidShowNotification() {
        
        omRemoveNotificationObserver(NSNotification.Name.UIKeyboardDidShow.rawValue)
    }
    
    func omRemoveKeyboardWillHideNotification() {
        
        omRemoveNotificationObserver(NSNotification.Name.UIKeyboardWillHide.rawValue)
    }
    
    func omRemoveKeyboardDidHideNotification() {
        
        omRemoveNotificationObserver(NSNotification.Name.UIKeyboardDidHide.rawValue)
    }
    
    func omKeyboardDidShowNotification(_ notification: Notification) {
        
        if let info = (notification as NSNotification).userInfo, let value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardDidShowWithFrame(value.cgRectValue)
        }
    }
    
    func omKeyboardWillShowNotification(_ notification: Notification) {
        
        if let info = (notification as NSNotification).userInfo, let value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardWillShowWithFrame(value.cgRectValue)
        }
    }
    
    func omKeyboardWillHideNotification(_ notification: Notification) {
        
        if let info = (notification as NSNotification).userInfo, let value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardWillHideWithFrame(value.cgRectValue)
        }
    }
    
    func omKeyboardDidHideNotification(_ notification: Notification) {
        
        if let info = (notification as NSNotification).userInfo, let value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            omKeyboardDidHideWithFrame(value.cgRectValue)
        }
    }
    
    func omKeyboardWillShowWithFrame(_ frame: CGRect) {
        
    }
    
    func omKeyboardDidShowWithFrame(_ frame: CGRect) {
        
    }
    
    func omKeyboardWillHideWithFrame(_ frame: CGRect) {
        
    }
    
    func omKeyboardDidHideWithFrame(_ frame: CGRect) {
        
    }
    
}

// MARK: - placeholder

private var __omPlaceholderView__: String = "__omPlaceholderView__"

private var __omPlaceholderImageView__: String = "__omPlaceholderImageView__"

private var __omPlaceholderTitleLabel__: String = "__omPlaceholderTitleLabel__"

private var __omPlaceholderDescriptionLabel__: String = "__omPlaceholderDescriptionLabel__"

private var __omPlaceholderButton__: String = "__omPlaceholderButton__"

public extension UIViewController {
    
    fileprivate var placeholderView: UIView? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderView__) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderView__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    fileprivate var placeholderImageView: UIImageView? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderImageView__) as? UIImageView
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderImageView__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    fileprivate var placeholderTitleLabel: UILabel? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderTitleLabel__) as? UILabel
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderTitleLabel__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    fileprivate var placeholderDescriptionLabel: UILabel? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderDescriptionLabel__) as? UILabel
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderDescriptionLabel__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    fileprivate var placeholderButton: UIButton? {
        
        get {
            return objc_getAssociatedObject(self, &__omPlaceholderButton__) as? UIButton
        }
        
        set {
            objc_setAssociatedObject(self, &__omPlaceholderButton__, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    fileprivate func omSetScrollEnabled(_ scrollEnabled: Bool) {
        
        view.subviews.forEach({ (subView) in
            
            if subView.isKind(of: UIScrollView.self){
                
                (subView as! UIScrollView).isScrollEnabled = scrollEnabled
            }
        })
        
        if isKind(of: UITableViewController.self) {
            
            (self as! UITableViewController).tableView.isScrollEnabled = scrollEnabled
        }
    }
    
    fileprivate func imageView(_ image: UIImage?, offset: CGFloat) {
        
        if placeholderImageView == nil {
            
            placeholderImageView = UIImageView(image: image)
            placeholderImageView?.contentMode = .center
            
            placeholderView?.addSubview(placeholderImageView!)
            
            placeholderImageView?.center.x = placeholderView!.center.x
            placeholderImageView?.center.y = placeholderView!.center.y + offset
        }
    }
    
    fileprivate func titleLabel(_ attributedString: NSAttributedString?, space: CGFloat) {
        
        if placeholderTitleLabel == nil {
            
            placeholderTitleLabel = UILabel()
            
            guard let _titleLabel = placeholderTitleLabel else {
                
                return
            }
            
            _titleLabel.textColor = UIColor(omHex: 0xc9c9c9)
            _titleLabel.font = UIFont.systemFont(ofSize: 27)
            _titleLabel.attributedText = attributedString
            _titleLabel.numberOfLines = 0
            _titleLabel.textAlignment = .center
            
            guard let _imageView = placeholderImageView else {
                
                return
            }
            
            guard let _view = placeholderView else {
                
                return
            }
            
            _titleLabel.sizeToFit()
            _titleLabel.frame.size.width = _view.frame.size.width - 30
            _titleLabel.frame.origin.y = _imageView.frame.origin.y + _imageView.frame.size.height + space
            
            let width2 = _titleLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 2).height
            let width1 = _titleLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 1).height
            
            if width2 > width1 {
                
                _titleLabel.sizeToFit()
            }
            
            _titleLabel.center.x = _imageView.center.x
            
            _view.addSubview(_titleLabel)
        }
    }
    
    fileprivate func descriptionlLabel(_ attributedString: NSAttributedString?, space: CGFloat) {
        
        if placeholderDescriptionLabel == nil {
            
            placeholderDescriptionLabel = UILabel()
            
            guard let _descriptionLabel = placeholderDescriptionLabel else {
                
                return
            }
            
            _descriptionLabel.textColor = UIColor(omHex: 0xcfcfcf)
            _descriptionLabel.font = UIFont.systemFont(ofSize: 17)
            _descriptionLabel.attributedText = attributedString
            _descriptionLabel.numberOfLines = 0
            _descriptionLabel.textAlignment = .center
            
            guard let _titleLabel = placeholderTitleLabel else {
                
                return
            }
            
            guard let _view = placeholderView else {
                
                return
            }
            
            _descriptionLabel.sizeToFit()
            _descriptionLabel.frame.size.width = _view.frame.size.width - 30
            _descriptionLabel.frame.origin.y = _titleLabel.frame.origin.y + _titleLabel.frame.size.height + space
            
            let width2 = _descriptionLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 2).height
            let width1 = _descriptionLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: _view.frame.size.width - 30, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 1).height
            
            if width2 > width1 {
                
                _descriptionLabel.sizeToFit()
            }
            
            _descriptionLabel.center.x = _titleLabel.center.x
            
            _view.addSubview(_descriptionLabel)
        }
    }
    
    fileprivate func button(_ backgroundImages: [(backgroundImage: UIImage?, state: UIControlState)]? = nil, titles: [(title: NSMutableAttributedString?, state: UIControlState)]? = nil, size: CGSize? = nil, space: CGFloat) {
        
        if placeholderButton == nil {
            
            placeholderButton = UIButton(type: .custom)
            
            guard let _button = placeholderButton else {
                
                return
            }
            
            _button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            backgroundImages?.forEach({_button.setBackgroundImage($0.backgroundImage, for: $0.state)})
            titles?.forEach({_button.setAttributedTitle($0.title, for: $0.state)})
            
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
    func omShowPlaceholder(_ image: UIImage? = nil, backgroundColor: UIColor = UIColor.clear, titleAttributedString: NSMutableAttributedString? = nil, descriptionAttributedString: NSMutableAttributedString? = nil, space: CGFloat = 8, shouldTap: Bool = false, offset: CGFloat = 0, buttonBackgroundImages: [(backgroundImage: UIImage?, state: UIControlState)]? = nil, titles: [(title: NSMutableAttributedString?, state: UIControlState)]? = nil, size: CGSize? = nil, buttonTapHandler: ((_ button: UIButton)->Void)? = nil) {
        
        omHidePlaceholder()
        
        var offsetY = offset
        
        if let navigation = navigationController  {
            
            offsetY = navigation.navigationBar.isTranslucent ? 0 : -64
            offsetY += offset
        }
        
        omSetScrollEnabled(shouldTap)
        
        placeholderView = UIView(frame: UIScreen.main.bounds)
        placeholderView?.backgroundColor = backgroundColor
        
        if shouldTap {
            
            view.insertSubview(placeholderView!, at: 0)
            
        } else {
            
            view.addSubview(placeholderView!)
        }
        
        imageView(image, offset: offsetY)
        titleLabel(titleAttributedString, space: space)
        descriptionlLabel(descriptionAttributedString, space: space)
        button(buttonBackgroundImages, titles: titles, size: size, space: space)
        
        placeholderButton?.omAddTapGestureRecognizer(handler: { [weak self] (_) in
            
            if let button = self?.placeholderButton {
                
                buttonTapHandler?(button)
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
