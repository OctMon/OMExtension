//
//  PlaceholderTVC.swift
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

class PlaceholderTVC: BaseTVC {
    
    var popular: PopularApp = PopularApp.Undefined

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.om.addTapGestureRecognizer { [unowned self] (_) in
            
            self.om.isShowPlaceholder ? self.om.hidePlaceholder() : self.showPlaceholder()
        }
        
        showPlaceholder()
    }
    
    @objc func showPlaceholder() {
        
        var barColor: UIColor? = nil
        var tintColor: UIColor? = nil
        var barstyle: UIStatusBarStyle = .default
        
        var backgroundColor = UIColor.white
        
        var text = ""
        var textColor = UIColor(white: 0.6, alpha: 1)
        var textFont = UIFont.systemFont(ofSize: 27)
        
        var description = ""
        var descriptionColor = UIColor(white: 0.6, alpha: 1)
        var descriptionFont = UIFont.systemFont(ofSize: 17)
        
        switch PopularApp(rawValue: title ?? "") ?? PopularApp.Undefined {
        case ._500px:
            barColor = UIColor(omHex: 0x242424)
            tintColor = UIColor(omHex: 0xD7D7D7)
            barstyle = .lightContent
            
            backgroundColor = UIColor.black
            
            text = "No Photos"
            textColor = UIColor(omHex: 0x545454)
            textFont = UIFont.boldSystemFont(ofSize: 17)
            
            description = "Get started by uploading a photo."
            descriptionColor = UIColor(omHex: 0x545454)
            descriptionFont = UIFont.boldSystemFont(ofSize: 15)
        case .Airbnb:
            barColor = UIColor(omHex: 0xF8F8F8)
            tintColor = UIColor(omHex: 0x08AEFF)
            
            backgroundColor = UIColor.white
            
            text = "No Messages"
            textColor = UIColor(omHex: 0xc9c9c9)
            textFont = UIFont(omFontName: UIFont.OM.Font.helveticaNeueLight, size: 22) ?? UIFont.systemFont(ofSize: 22)
            
            description = "When you have messages, you’ll see them here."
            descriptionColor = UIColor(omHex: 0xcfcfcf)
            descriptionFont = UIFont.systemFont(ofSize: 13)
        case .AppStore:
            barColor = UIColor(omHex: 0xF8F8F8)
            tintColor = UIColor(omHex: 0x08AEFF)
            
            description = "There are no results for “wwdc2014”."
            descriptionColor = UIColor(omHex: 0x333333)
            descriptionFont = UIFont.systemFont(ofSize: 14)
        case .Camera:
            barColor = UIColor(omHex: 0x595959)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            text = "Please Allow Photo Access"
            textColor = UIColor(omHex: 0x5f6978)
            textFont = UIFont.boldSystemFont(ofSize: 18)
            
            description = "This allows you to share photos from your library and save photos to your camera roll."
            descriptionColor = UIColor(omHex: 0x5f6978)
            descriptionFont = UIFont.systemFont(ofSize: 14)
        case .Dropbox:
            barColor = UIColor.white
            tintColor = UIColor(omHex: 0x007ee5)
            
            backgroundColor = UIColor(omHex: 0xf0f3f5)
            
            text = "Star Your Favorite Files"
            textColor = UIColor(omHex: 0x25282b)
            textFont = UIFont.boldSystemFont(ofSize: 17)
            
            description = "Favorites are saved for offline access."
            descriptionColor = UIColor(omHex: 0x7b8994)
            descriptionFont = UIFont.systemFont(ofSize: 14.5)
        case .Facebook:
            barColor = UIColor(omHex: 0x506da8)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            backgroundColor = UIColor(omHex: 0xeceef7)
            
            text = "No friends to show."
            textColor = UIColor(omHex: 0xacafbd)
            textFont = UIFont.boldSystemFont(ofSize: 22)
            
            description = "When you have messages, you’ll see them here."
            descriptionColor = UIColor(omHex: 0xcfcfcf)
            descriptionFont = UIFont.systemFont(ofSize: 13)
        case .Fancy:
            barColor = UIColor(omHex: 0x353b49)
            tintColor = UIColor(omHex: 0xc4c7cb)
            barstyle = .lightContent
            
            backgroundColor = UIColor(omHex: 0xf0f0f0)
            
            text = "No Owns yet"
            textColor = UIColor(omHex: 0x494c53)
            textFont = UIFont.boldSystemFont(ofSize: 14)
            
            description = "Tap Add to List and add things to Owns"
            descriptionColor = UIColor(omHex: 0x7a7d83)
            descriptionFont = UIFont.systemFont(ofSize: 13)
        case .Foursquare:
            barColor = UIColor(omHex: 0x00aeef)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            backgroundColor = UIColor(omHex: 0xfcfcfa)
            
            description = "Nobody has liked or commented on your check-ins yet."
            descriptionColor = UIColor(omHex: 0xcecbc6)
            descriptionFont = UIFont.boldSystemFont(ofSize: 14)
        case .iCloud:
            text = "iCloud Photo Sharing"
            
            description = "Share photos and videos with just the people you choose, and let them add photos, videos, and comments."
        case .Instagram:
            barColor = UIColor(omHex: 0x2e5e86)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            backgroundColor = UIColor.white
            
            text = "Instagram Direct"
            textColor = UIColor(omHex: 0x444444)
            textFont = UIFont(omFontName: UIFont.OM.Font.helveticaNeueLight, size: 26) ?? UIFont.systemFont(ofSize: 26)
            
            description = "Send photos and videos directly to your friends. Only the people you send to can see these posts."
            descriptionColor = UIColor(omHex: 0x444444)
            descriptionFont = UIFont.systemFont(ofSize: 16)
        case .iTunes_Connect:
            text = "No Favorites"
            textFont = UIFont.systemFont(ofSize: 22)
            
            description = "To add a favorite, tap the star icon next to an App's name."
            descriptionFont = UIFont.systemFont(ofSize: 14)
        case .Kickstarter:
            barColor = UIColor(omHex: 0xF8F8F8)
            tintColor = UIColor(omHex: 0x2bde73)
            
            backgroundColor = UIColor(omHex: 0xf7fafa)
            
            text = "Activity empty"
            textColor = UIColor(omHex: 0x828587)
            textFont = UIFont.boldSystemFont(ofSize: 16)
            
            description = "When you back a project or follow a friend, their activity will show up here."
            descriptionColor = UIColor(omHex: 0x828587)
            descriptionFont = UIFont.systemFont(ofSize: 14)
        case .Path:
            barColor = UIColor(omHex: 0x544f49)
            tintColor = UIColor(omHex: 0xfffff2)
            barstyle = .lightContent
            
            backgroundColor = UIColor(omHex: 0x726d67)
            
            text = "Message Your Friend"
            textColor = UIColor.white
            textFont = UIFont.boldSystemFont(ofSize: 14)
            
            description = "Send a message or create a group."
            descriptionColor = UIColor(omHex: 0xa6978d)
            descriptionFont = UIFont.systemFont(ofSize: 14)
        case .Pinterest:
            barColor = UIColor(omHex: 0xf4f4f4)
            tintColor = UIColor(omHex: 0xcb2027)
            
            backgroundColor = UIColor(omHex: 0xe1e1e1)
            
            text = "No boards to display"
            textColor = UIColor(omHex: 0x666666)
            textFont = UIFont.boldSystemFont(ofSize: 18)
        case .Photos:
            text = "No Photos or Videos"
            
            description = "You can sync photos and videos onto your iPhone using iTunes."
        case .Podcasts:
            text = "No Podcasts"
            
            description = "You can subscribe to podcasts in Top Charts or Featured."
        case .Remote:
            text = "Cannot Connect to a Local Networ"
            textColor = UIColor(omHex: 0x555555)
            textFont = UIFont(omFontName: UIFont.OM.Font.helveticaNeueMedium, size: 18) ?? UIFont.systemFont(ofSize: 18)
            
            description = "You must connect to a Wi-Fi network to control iTunes or Apple TV"
            descriptionColor = UIColor(omHex: 0x555555)
            descriptionFont = UIFont(omFontName: UIFont.OM.Font.helveticaNeueMedium, size: 11.75) ?? UIFont.systemFont(ofSize: 11.75)
        case .Safari:
            description = "Safari cannot open the page because your iPhone is not connected to the Internet."
            descriptionColor = UIColor(omHex: 0x7d7f7f)
        case .Skype:
            barColor = UIColor(omHex: 0x00aff0)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            description = "Keep all your favorite people together, add favorites."
            descriptionColor = UIColor(omHex: 0xa6c3d1)
            descriptionFont = UIFont(omFontName: UIFont.OM.Font.helveticaNeueLight, size: 17.75) ?? UIFont.systemFont(ofSize: 17.75)
        case .Slack:
            barColor = UIColor(omHex: 0xf4f5f6)
            tintColor = UIColor(omHex: 0x3eba92)
            
            backgroundColor = UIColor.white
            
            description = "You don't have any recent mentions"
            descriptionColor = UIColor(omHex: 0xd7d7d7)
            descriptionFont = UIFont(omFontName: UIFont.OM.Font.copperplate, size: 19) ?? UIFont.systemFont(ofSize: 19)
        case .Tumblr:
            barColor = UIColor(omHex: 0x2e3e53)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            backgroundColor = UIColor(omHex: 0x34465c)
            
            text = "This is your Dashboard."
            textColor = UIColor(omHex: 0xaab6c4)
            textFont = UIFont.boldSystemFont(ofSize: 18)
            
            description = "When you follow some blogs, their latest posts will show up here!"
            descriptionColor = UIColor(omHex: 0x828e9c)
            descriptionFont = UIFont.systemFont(ofSize: 17)
        case .Twitter:
            barColor = UIColor(omHex: 0x58aef0)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            backgroundColor = UIColor(omHex: 0xf5f8fa)
            
            text = "No lists"
            textColor = UIColor(omHex: 0x292f33)
            textFont = UIFont.boldSystemFont(ofSize: 14)
            
            description = "You aren’t subscribed to any lists yet."
            descriptionColor = UIColor(omHex: 0x8899a6)
            descriptionFont = UIFont.systemFont(ofSize: 12)
        case .Vesper:
            barColor = UIColor(omHex: 0x5e7d9a)
            tintColor = UIColor(omHex: 0xf8f8f8)
            barstyle = .lightContent
            
            backgroundColor = UIColor(omHex: 0xf8f8f8)
            
            text = "No Notes"
            textColor = UIColor(omHex: 0xd9dce1)
            textFont = UIFont(omFontName: UIFont.OM.Font.gillSans, size: 16) ?? UIFont.systemFont(ofSize: 16)
            
            description = "When you have messages, you’ll see them here."
            descriptionColor = UIColor(omHex: 0xcfcfcf)
            descriptionFont = UIFont.systemFont(ofSize: 13)
        case .Videos:
            barColor = UIColor(omHex: 0x4a4b4d)
            tintColor = UIColor.black
            
            backgroundColor = UIColor.black
            
            text = "AirPlay"
            textColor = UIColor(omHex: 0x414141)
            textFont = UIFont.systemFont(ofSize: 17)
            
            description = "You aren’t subscribed to any lists yet."
            descriptionColor = UIColor(omHex: 0x8899a6)
            descriptionFont = UIFont.systemFont(ofSize: 12)
        case .Vine:
            barColor = UIColor(omHex: 0x00bf8f)
            tintColor = UIColor.white
            barstyle = .lightContent
            
            text = "Welcome to VMs"
            textColor = UIColor(omHex: 0x595959)
            textFont = UIFont.boldSystemFont(ofSize: 22)
            
            description = "This is where your private conversations will live"
            descriptionColor = UIColor(omHex: 0xa6a6a6)
            descriptionFont = UIFont.systemFont(ofSize: 17)
        case .WhatsApp:
            backgroundColor = UIColor(omHex: 0xf2f2f2)
            
            text = "No Media"
            textColor = UIColor(omHex: 0x808080)
            textFont = UIFont.boldSystemFont(ofSize: 20)
            
            description = "You can exchange media with Ignacio by tapping on the Arrow Up icon in the conversation screen."
            descriptionColor = UIColor(omHex: 0x989898)
            descriptionFont = UIFont.systemFont(ofSize: 15)
        case .WWDC:
            tintColor = UIColor(omHex: 0xfc6246)
            
            text = "No Favorites"
            textColor = UIColor(omHex: 0xb9b9b9)
            textFont = UIFont(omFontName: UIFont.OM.Font.helveticaNeueMedium, size: 16) ?? UIFont.systemFont(ofSize: 16)
            
            description = "Favorites are only available to Registered Apple Developers."
            descriptionColor = UIColor(omHex: 0xb9b9b9)
            descriptionFont = UIFont.systemFont(ofSize: 16)
        default:
            barColor = UIColor(omHex: 0xf8f8f8)
            tintColor = UIApplication.shared.keyWindow?.tintColor
            break
        }
        
        let logo = UIImage(named: "logo_" + (title?.lowercased() ?? ""))
        
        if logo != nil {
            
            navigationItem.titleView = UIImageView(image: logo)
            
        } else {
            
            navigationItem.titleView = nil
        }
        
        navigationController?.navigationBar.titleTextAttributes = nil
        navigationController?.navigationBar.tintColor = tintColor
        navigationController?.navigationBar.barTintColor = barColor
        navigationController?.navigationBar.isTranslucent = false
        
        UIApplication.shared.setStatusBarStyle(barstyle, animated: true)
        
        let image = UIImage(named: "placeholder_" + title!.lowercased().replacingOccurrences(of: "", with: "_", options: NSString.CompareOptions.caseInsensitive, range: nil))
        
        om.showPlaceholder(image: image, backgroundColor: backgroundColor, titleAttributedString: text.omGetAttributes(color: [(textColor, text)], font: [(textFont, text)]), descriptionAttributedString: description.omGetAttributes(color: [(descriptionColor, description)], font: [(descriptionFont, description)]))
    }
}
