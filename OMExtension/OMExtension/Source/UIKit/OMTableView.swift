//
//  OMTableView.swift
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

public extension OMExtension where OMBase: UITableView {
    
    func setHeader(height: CGFloat) {
        
        var view = UIView()
        view.om.height = height
        base.tableHeaderView = view
    }
    
    func setHeaderZero() {
        
        setHeader(height: 0.1)
    }
    
    func setFooter(height: CGFloat) {
        
        var view = UIView()
        view.om.height = height
        base.tableFooterView = view
    }
    
    func setFooterZero() {
        
        setFooter(height: 0)
    }
}
    
public extension OMExtension where OMBase: UITableView {
    
    var lastSection: Int {
        
        return base.numberOfSections > 0 ? base.numberOfSections - 1 : 0
    }
    
    func lastRow(inSection section: Int = 0) -> IndexPath? {
        
        guard section >= 0, base.numberOfSections > section else {
            
            return nil
        }
        
        return IndexPath(row: base.numberOfRows(inSection: section) - 1, section: section)
    }
    
    func scrollToBottom(animated: Bool = true) {
        
        let bottomOffset = CGPoint(x: 0, y: base.contentSize.height - base.bounds.size.height)
        
        base.setContentOffset(bottomOffset, animated: animated)
    }
    
    func scrollToTop(animated: Bool = true) {
        
        base.setContentOffset(CGPoint.zero, animated: animated)
    }
}

public extension OMExtension where OMBase: UITableView {
    
    func reloadAnimationWave() {
        
        base.isUserInteractionEnabled = false
        
        base.setContentOffset(base.contentOffset, animated: false)
        
        Thread.OM.runInMain(delay: 0.05) {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.base.isHidden = true
                self.base.reloadData()
                
            }, completion: { (_) in
                
                self.base.isHidden = false
                self.base.visibleRowsBeginAnimation()
            })
        }
    }
}

public extension UITableView {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `tableView.om.reloadAnimationWave` instead.", renamed: "om.reloadAnimationWave")
    func omReloadAnimationWithWave() {
        
        om.reloadAnimationWave()
    }
    
    fileprivate func visibleRowsBeginAnimation() {
        
        let array = indexPathsForVisibleRows
        
        if let pathArray = array {
            
            for path in pathArray {
                
                let cell = cellForRow(at: path)
                cell?.center = CGPoint(x: frame.size.width * 0.5, y: cell!.center.y)
            }
            
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            
            for (num, item) in pathArray.enumerated() {
                
                let cell = self.cellForRow(at: item)
                cell?.isHidden = true
                let i: Double = Double(num)
                
                perform(#selector(UITableView.animationStart(_:)), with: item, afterDelay: 0.1 * (i + 1))
            }
        }
    }
    
    @objc fileprivate func animationStart(_ path: IndexPath) {
        
        let cell = cellForRow(at: path)
        
        if let animationCell = cell {
            
            let originPoint = animationCell.center
            animationCell.center = CGPoint(x: animationCell.frame.size.width, y: originPoint.y)
            
            UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions(), animations: {
                
                animationCell.center = CGPoint(x: originPoint.x - 2, y: originPoint.y)
                animationCell.isHidden = false
                
            }) { (_) in
                
                UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions(), animations: {
                    
                    animationCell.center = CGPoint(x: originPoint.x + 2, y: originPoint.y)
                    
                    }, completion: { (_) in
                        
                        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions(), animations: {
                            
                            animationCell.center = originPoint
                            
                            }, completion: { (_) in
                                
                                self.isUserInteractionEnabled = true
                        })
                })
            }
        }
    }

}

#endif
