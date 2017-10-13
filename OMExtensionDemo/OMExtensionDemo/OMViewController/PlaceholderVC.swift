//
//  PlaceholderVC.swift
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

class PlaceholderVC: BaseVC {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @objc let dataSource = [
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
    
    @objc var getImage: UIImage? {
        
        let app = PopularApp(rawValue: dataSource.omRandom()!.element)!
        
        return UIImage(named: "placeholder_" + app.rawValue.lowercased().replacingOccurrences(of: "", with: "_", options: NSString.CompareOptions.caseInsensitive, range: nil))
    }
    
    @objc var getButtonBackgroundImageName: String {
        
        let app = PopularApp(rawValue: dataSource.omRandom()!.element)!
        
        return "button_background_" + app.rawValue.lowercased()
    }
    
    @objc var timer: Timer?
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let timer = timer, timer.isValid {
            
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        om.showPlaceholder(image: getImage)
        
        timer = Timer.OM.runLoop(seconds: 1) { (timer) in
            
            if let image = self.getImage {
                
                let title = "empty set button"
                
                let backgroundImageName = self.getButtonBackgroundImageName
                
                let backgroundImageNormal = UIImage(named: backgroundImageName + "_normal")
                let backgroundImageHighlight = UIImage(named: backgroundImageName + "_highlight")
                
                self.om.showPlaceholder(image: image, shouldTap: true, offset: image.size.width * 0.5, bringSubviews: [self.segmentControl], buttonBackgroundImages: [(backgroundImageNormal, state: UIControlState()), (backgroundImageHighlight, state: UIControlState.highlighted)], buttonTitles: (backgroundImageNormal != nil ? [(title.omGetAttributes(), UIControlState())] : nil), buttonTapHandler: { (button) in
                    
                    print(button.isSelected)
                    
                    })
                
            } else {
                
                let title = "No Image"
                
                self.om.showPlaceholder(image: nil, titleAttributedString: title.omGetAttributes(color: [(UIColor.gray, title)]), shouldTap: false, offset: 64)
            }
            
        }
        
    }

}
