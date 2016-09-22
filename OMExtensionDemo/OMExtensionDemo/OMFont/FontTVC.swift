//
//  FontTVC.swift
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

import UIKit

class FontTVC: BaseTVC {
    
    var fonts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        
        tableView.estimatedRowHeight = 44
        
        UIFont.familyNames().sort().forEach({ (family) in
            UIFont.fontNamesForFamilyName(family).sort().forEach({ (font) in
                fonts.append(font)
            })
        })
        
        NSThread.omRunInMainThread(delay: 0.1) { 
            
            self.tableView.reloadData()
        }
    }

}

extension FontTVC {
    
    // MARK: Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fonts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(UITableViewCell.omClassName, forIndexPath: indexPath)
        
        cell.selectionStyle = .None
        
        cell.textLabel?.font = UIFont(name: fonts[indexPath.row], size: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline).pointSize)
        cell.textLabel?.text = fonts[indexPath.row]
        
        cell.detailTextLabel?.font = UIFont(name: fonts[indexPath.row], size: UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline).pointSize)
        cell.detailTextLabel?.text = "壹貳參" + "，。#@" + "OctMon" + ",.#@" + " 123" + "abc" + "ABC"
        
        return cell
    }
}
