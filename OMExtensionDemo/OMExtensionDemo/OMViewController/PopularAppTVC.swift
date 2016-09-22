//
//  PopularAppTVC.swift
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

enum PopularApp: String {
    case _500px = "500px"
    case Airbnb
    case AppStore
    case Camera
    case Dropbox
    case Facebook
    case Fancy
    case Foursquare
    case iCloud
    case Instagram
    case iTunes_Connect = "iTunes Connect"
    case Kickstarter
    case Path
    case Pinterest
    case Photos
    case Podcasts
    case Remote
    case Safari
    case Skype
    case Slack
    case Tumblr
    case Twitter
    case Videos
    case Vesper
    case Vine
    case WhatsApp
    case WWDC
    
    case Undefined
}

class PopularAppTVC: BaseTVC {
    
    let dataSource = [
        "500px",
        "Airbnb",
        "AppStore",
        "Camera",
        "Dropbox",
        "Facebook",
        "Fancy",
        "Foursquare",
        "iCloud",
        "Instagram",
        "iTunes Connect",
        "Kickstarter",
        "Path",
        "Pinterest",
        "Photos",
        "Podcasts",
        "Remote",
        "Safari",
        "Skype",
        "Slack",
        "Tumblr",
        "Twitter",
        "Videos",
        "Vesper",
        "Vine",
        "WhatsApp",
        "WWDC"
    ]
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.titleTextAttributes = nil
        navigationController?.navigationBar.barTintColor = nil
        navigationController?.navigationBar.tintColor = nil
        navigationController?.navigationBar.translucent = false
        
        UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 70
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(UITableViewCell.omClassName, forIndexPath: indexPath)
        
        cell.imageView?.image = UIImage(named: "icon_" + dataSource[indexPath.row].lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "_", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil))
        cell.textLabel?.text = dataSource[indexPath.row]
        
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = (cell.imageView?.image?.size.width ?? 0) * 0.2
        cell.imageView?.layer.borderColor = UIColor.grayColor().colorWithAlphaComponent(0.2).CGColor
        cell.imageView?.layer.borderWidth = 0.5
        cell.imageView?.layer.shouldRasterize = true
        cell.imageView?.layer.rasterizationScale = UIScreen.mainScreen().scale
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let controller = UIStoryboard.omInstantiateViewController(name: UIViewController.omClassName, identifier: PlaceholderTVC.omClassName) {
            
            controller.title = dataSource[indexPath.row]
            
            showViewController(controller, sender: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
