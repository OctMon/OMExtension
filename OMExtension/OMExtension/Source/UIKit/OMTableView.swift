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
import UIKit

public extension UITableView {
    
    func omReloadAnimationWithWave() {
        
        setContentOffset(contentOffset, animated: false)
        
        UIView.animateWithDuration(0.2, animations: {
            
            self.hidden = true
            self.reloadData()
            
        }) { (_) in
            
            self.hidden = false
            self.visibleRowsBeginAnimation()
        }
    }
    
    private func visibleRowsBeginAnimation() {
        
        let array = indexPathsForVisibleRows
        
        if let pathArray = array {
            
            for path in pathArray {
                
                let cell = cellForRowAtIndexPath(path)
                cell?.center = CGPointMake(frame.size.width * 0.5, cell!.center.y)
            }
            
            NSObject.cancelPreviousPerformRequestsWithTarget(self)
            
            for (num, item) in pathArray.enumerate() {
                
                let cell = self.cellForRowAtIndexPath(item)
                cell?.hidden = true
                let i: Double = Double(num)
                
                performSelector(#selector(UITableView.animationStart(_:)), withObject: item, afterDelay: 0.1 * (i + 1))
            }
        }
    }
    
    @objc private func animationStart(path: NSIndexPath) {
        
        let cell = cellForRowAtIndexPath(path)
        
        if let animationCell = cell {
            
            let originPoint = animationCell.center
            animationCell.center = CGPointMake(animationCell.frame.size.width, originPoint.y)
            
            UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseInOut, animations: {
                
                animationCell.center = CGPointMake(originPoint.x - 2, originPoint.y)
                animationCell.hidden = false
                
            }) { (_) in
                
                UIView.animateWithDuration(0.1, delay: 0, options: .CurveEaseInOut, animations: {
                    
                    animationCell.center = CGPointMake(originPoint.x + 2, originPoint.y)
                    
                    }, completion: { (_) in
                        
                        UIView.animateWithDuration(0.1, delay: 0, options: .CurveEaseInOut, animations: {
                            
                            animationCell.center = originPoint
                            
                            }, completion: nil)
                })
            }
        }
    }

}
