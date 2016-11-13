# OMExtension

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/OMExtension.svg)](https://img.shields.io/cocoapods/v/OMExtension.svg) 

## Requirements

- iOS 8.0+
- Swift 3 (OMExtension 1.1.x), Swift 2.3 (OMExtension 1.0.x)

## 安装和使用

### Git Submodule

Execute:

```git submodule add https://github.com/OctMon/OMExtension.git```

in your repository folder.

### [Carthage](https://github.com/Carthage/Carthage)

Add the following line to your `Cartfile`.

```github "OctMon/OMExtension"```

Then run `carthage update --no-use-binaries` or just `carthage update`. For details of the installation and usage of Carthage, visit [it's project page](https://github.com/Carthage/Carthage).

### [CocoaPods](https://cocoapods.org/)

Add the following lines to your `Podfile`.

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'OMExtension'

swift <= 2.3 use
pod 'OMExtension', '< 1.1'
```

Then run `pod install`. For details of the installation and usage of CocoaPods, visit [it's official web site](https://cocoapods.org/).

### 使用时在任意swift文件导入一次即可

```swift
import OMExtension
```

## Foundation

- [Array](#array)
- [Bool](#bool)
- [Data](#data)
- [Date](#date)
- [Dictionary](#dictionary)
- [Double](#double)
- [FileManager](#filemanager)
- [Int](#int)
- [NSObject](#nsobject)
- [String](#string)
- [Thread](#thread)
- [Timer](#timer)
- [URLRequest](#urlrequest)

## UIKit

- [CGRect](#cgrect)
- [UIAlertController](#uialertcontroller)
- [UIApplaction](#uiapplaction)
- [UIBarButtonItem](#uibarbuttonitem)
- [UIButton](#uibutton)
- [UIColor](#uicolor)
- [UIDevice](#uidevice)
- [UIFont](#uifont)
- [UIImage](#uiimage)
- [UINavigationBar](#uinavigationbar)
- [UIScreen](#uiscreen)
- [UIStoryboard](#uistoryboard)
- [UITableView](#uitableview)
- [UITextField](#uitextfield)
- [UITextView](uitextview)
- [UIView](#uiview)
- [UIViewController](#uiviewcontroller)

### Array

```swift
let number = [Int](10...20)
number.omRandom() // Optional((1, 11))
number.omAtIndex(3) // Optional(13)
number.omAtIndex(33) // nil
number.omDifference([10, 11], [17, 18]) // [12, 13, 14, 15, 16, 19, 20]
[Int](1...10).omUnion(number, [21, 22]) // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
number.omIntersection([Int](10...13), [11, 12]) // [10, 11, 12, 13]
```

### Bool

```swift
var isValid = false
print(isValid.omToInt) // 0
isValid.omToggle()
print(isValid) // true
print(isValid.omToInt) // 1
```

### Data

Data转json

```swift
httpBody?.omToJson()
```

Any转json

```swift
Data.omToJson(from: allHTTPHeaderFields)
```

### Date

```swift
let date = Date.omWithTimeStamp(Date().timeIntervalSince1970 * 1000)

print(date) // 2016-08-29 07:29:21 +0000
date.omYearString // 2016
date.omMonthString // August
date.omWeekdayString // Monday
date.omDateInfo().month // 8
date.omDateInfo() // OMDateInfo(year: 2016, month: 8, day: 29, weekday: 5, hour: 15, minute: 29, second: 21, nanosecond: 898715019)
date.omDateInfo().omString(nanosecond: true) // 2016-08-29 15:29:21:899
```

### Dictionary

```swift
let first = ["b": 98, "a": 97, "c": 99]
let second = ["b": 98, "e": 101, "a": 97, "f": 102, "d": 100]

first.omRandom() // ("c", 99)
first.omUnion(second) // ["b": 98, "e": 101, "a": 97, "f": 102, "d": 100, "c": 99]
first.omDifference(second) // ["c": 99]
first.omIntersection(second) // ["b": 98, "a": 97]
second.omFilter({ (key, value) -> Bool in
    value > 100
}) // ["e": 101, "f": 102]
```

### Double

```swift
let double: Double = 100.0

print(type(of: double.omToInt)) // Int
print(type(of: double.omToDate)) // Date
print(type(of: double.omToString)) // String
print(100.58.omToDecimalStyle()) // 100.58
print(123.456.omToDecimalStyle(3)) // 123.456
```

### FileManager

在cachesDirectory创建download目录

```swift
FileManager.omCreateDirectory(for: .cachesDirectory, path: "download")
```

获取 documentDirectory

```swift
print(FileManager.omDocumentDirectory())
// file:///Users/octmon/Library/Developer/CoreSimulator/Devices/1C975A61-2498-44AE-BBEE-BF921A246E5B/data/Containers/Data/Application/C62F47FB-625E-453B-AB34-B0CA51296F36/Documents/
```

获取 cachesDirectory中download目录

```swift
print(FileManager.omCachesDirectory(path: "download").path)
// /Users/octmon/Library/Developer/CoreSimulator/Devices/1C975A61-2498-44AE-BBEE-BF921A246E5B/data/Containers/Data/Application/C62F47FB-625E-453B-AB34-B0CA51296F36/Library/Caches/download
```

documentDirectory中user.dat是否存在

```swift
print(FileManager.omFileExists(path: "user.dat"))
print(FileManager.omFileExists(for: .cachesDirectory, path: "download"))
print(FileManager.omFileExists(at: FileManager.omDocumentDirectory(path: "user.dat")))

// nil
// Optional(file:///Users/octmon/Library/Developer/CoreSimulator/Devices/1C975A61-2498-44AE-BBEE-BF921A246E5B/data/Containers/Data/Application/A7108007-93D6-4C0D-99E4-0D2BC6474D6C/Library/Caches/download/)
// nil
```

获取文件大小

```swift
print(FileManager.omFileSize(at: FileManager.omCachesDirectory(path: "download")))

// 68
```

删除文件

```swift
FileManager.omRemoveItem(at: FileManager.omDocumentDirectory(path: "user.data"))
```

### Int

```swift
let int: Int = 123

print(int.omToFloat) // 123.0
print(int.omToDouble) // 123.0
print(type(of: int.omToString)) //String
print(type(of: int.omToFloat)) // Float
print(type(of: int.omToDouble)) // Double
print(int.omIsOdd) // true
print(int.omIsEven) // false
```

### NSObject

获取类型名称

```swift
print(NSObject.omClassName) // NSObject
print(UIApplication.sharedApplication().omClassName) // UIApplication
print(omDeinitLog) // ApplicationTVC♻️deinit
```

### String

类型转换

```swift
let string: String = "128.00"
        
print(string.omToDouble) // Optional(128.0)
print(string.omToFloat) // Optional(128.0)
print(string.omToInt) // Optional(128)
print(string.omToBool) // nil

print(type(of: string.omToDouble)) // Optional<Double>
print(type(of: string.omToFloat)) // Optional<Float>
print(type(of: string.omToInt)) // Optional<Int>
print(type(of: string.omToBool)) // Optional<Bool>
```

手机号验证

```swift
string.omIsIP
```

电话号码验证

```swift
string.omIsPhoneTelephone
```

邮箱验证

```swift
string.omIsEmail
```

URL网址验证

```swift
string.omIsURL
```

IP地址验证

```swift
string.omIsIP
```

纯数字验证

```swift
string.omIsNumber
```

身份证号验证

```swift
string.omIsIDCard
```

提取URL

```swift
print("https://github.com/OctMon 关注 start http http://google.com".omExtractURL) // [https://github.com/OctMon, http://google.com]
```

复制文本

```swift
"https://github.com/OctMon".omCopyToPasteboard()
```

计算高度

```swift
print("https://github.com/OctMon".omHeight(320, font: UIFont.systemFontOfSize(12))) // 15.0
```

计算高度

```swift
print("   https://github.com/OctMon  ".omTrimming) // https://github.com/OctMon
```

字符串分离

```swift
print("https:// github. com/ OctMon  ".omSplit(" ")[3]) // OctMon
```

字符串包含

```swift
print("https://github.com/OctMon".omContains("OctMon")) // true
```

获取子串的NSRange

```swift
print("https://github.com/OctMon".omGetRanges("OctMon")) // [(19,6)]
```

NSMutableAttributedString

```swift
let mutableAttributedString = ("https://github.com/OctMon".omGetAttributes(color: [(color: UIColor.redColor(), subString: "github")], font: [(font: UIFont.systemFontOfSize(12), subString: "Octmon")]))
```

### Thread

```swift
Thread.omRunInMainThread(delay: 1) {
    // 1s后在主线程延时执行
}
```

### Timer

```swift
Timer.omRunLoop(seconds: 1, handler: { (timer) in
            
    total-=1
    print(total)

    if total <= 0 && timer.valid {

        timer.invalidate()

        print("invalidate")
    }
})
```

### URLRequest

打印请求、响应日志

```swift
requestMyServers(urlRequest: URLRequest(url: URL(string: "http://itunes.apple.com/US/lookup?id=414478124")!))?.responseMyServers(completionHandler: { (_) in

})
```

封装请求  [Alamofire](https://github.com/Alamofire/Alamofire)

```swift
import Alamofire

/**
 请求前打印日志
 
 - parameter URLRequest: 路由
 
 - returns: Request
 */
@discardableResult
func requestMyServers(urlRequest: URLRequestConvertible) -> DataRequest? {
    
    urlRequest.urlRequest?.omPrintRequestLog()
    
    return request(urlRequest).validate()
}

extension DataRequest {
    
    /**
     收到请求
     
     - parameter handler: 回调
     */
    func responseMyServers(completionHandler: @escaping (DataResponse<Any>) -> Void) {
        
        responseJSON { (response) in
            
            self.request?.omPrintResponseLog(response: response.response, data: response.data, error: response.result.error, requestDuration: response.timeline.requestDuration)
            
            completionHandler(response)
        }
    }
}
```

```swift
urlRequest.urlRequest?.omPrintRequestLog()

->->->->->->->->->->Request->->->->->->->->->
[URL]		http://itunes.apple.com/US/lookup?id=414478124
[Method]	GET
[Timeout]	60.0
->->->->->->->->->->Request->->->->->->->->->
```

```swift
self.request?.omPrintResponseLog(response: response.response, data: response.data, error: response.result.error, requestDuration: response.timeline.requestDuration)

->->->->->->->->->->Response->->->->->->->->->
[URL]		http://itunes.apple.com/US/lookup?id=414478124
[Method]	GET
[Timeout]	60.0
----------------------200------------------->
[Duration]	0.757575988769531
[Size]		4958 bytes
[Data]
{
  "resultCount" : 1,
  "results" : [
    {
      "artistId" : 614694882,
      "version" : "6.3.30",
      "primaryGenreName" : "Social Networking",
      "genreIds" : [
        "6005",
        "6007"
      ],
      "artworkUrl60" : "http:\/\/is5.mzstatic.com\/image\/thumb\/Purple71\/v4\/fe\/ed\/a1\/feeda179-73fc-0460-48c0-194997842dac\/source\/60x60bb.jpg",
      "userRatingCountForCurrentVersion" : 3,
      "minimumOsVersion" : "7.0",
      "appletvScreenshotUrls" : [

      ],
      "sellerName" : "Tencent Technology (Shenzhen) Company Limited",
      "supportedDevices" : [
        "iPhone4",
        "iPad2Wifi",
        "iPad23G",
        "iPhone4S",
        "iPadThirdGen",
        "iPadThirdGen4G",
        "iPhone5",
        "iPodTouchFifthGen",
        "iPadFourthGen",
        "iPadFourthGen4G",
        "iPadMini",
        "iPadMini4G",
        "iPhone5c",
        "iPhone5s",
        "iPhone6",
        "iPhone6Plus",
        "iPodTouchSixthGen"
      ],
      "genres" : [
        "Social Networking",
        "Productivity"
      ],
      "currentVersionReleaseDate" : "2016-11-03T08:38:20Z",
      "trackName" : "WeChat",
      "isVppDeviceBasedLicensingEnabled" : true,
      "description" : "Over half a billion people use WeChat, the free messaging & calling app that allows you to easily connect with family & friends across countries. It’s the all-in-one communications app for free text (SMS\/MMS), voice & video calls, moments, photo sharing, and games.\nWHY USE WECHAT:\n• ALWAYS FREE: No annual subscription fee. Absolutely free for life.\n• FREE VOICE & VIDEO CALLS: High-quality free calls to anywhere in the world.\n• GROUP CHAT: Create group chats with up to 500 people.\n• MULTIMEDIA MESSAGING: Send video, image, text, and voice messages.\n• STICKER GALLERY: Hundreds of free fun, animated stickers to express your feelings from some of your favorite cartoons and movies.\n• MOMENTS: Share your best moments on your personal photo stream.\n• BETTER PRIVACY: WeChat gives you the highest level of control over your privacy. It’s the only messaging app to be certified by TRUSTe.\n• MEET NEW FRIENDS: Use “Friend Radar”, “People Nearby” and “Shake” to meet others.\n• ADDICTIVE GAMES: Compete with your friends on some of the hottest games.\n• REALTIME LOCATION: Instead of having to tell others where you are, just use real-time location sharing.\n• LANGUAGE SUPPORT: Localized in 20 different languages and can translate messages to any language\n• AND MORE: Desktop app, custom wallpaper, custom notifications, group walkie-talkie, official accounts.\n• WeRun-WeChat: Access HealthKit data and challenge friends to beat their scores via the \"WeRun-WeChat\" Official Account.",
      "price" : 0,
      "trackId" : 414478124,
      "releaseDate" : "2011-01-21T01:32:15Z",
      "advisories" : [
        "Infrequent\/Mild Sexual Content and Nudity"
      ],
      "screenshotUrls" : [
        "http:\/\/a2.mzstatic.com\/us\/r30\/Purple62\/v4\/67\/a9\/67\/67a96743-3a1f-8df2-d27c-b268873aa000\/screen696x696.jpeg",
        "http:\/\/a1.mzstatic.com\/us\/r30\/Purple71\/v4\/18\/13\/c2\/1813c2dd-98b9-bb2d-ec89-bdf14a29a9c8\/screen696x696.jpeg",
        "http:\/\/a1.mzstatic.com\/us\/r30\/Purple62\/v4\/04\/fe\/b8\/04feb813-ca57-ff65-0c03-186cf21047df\/screen696x696.jpeg",
        "http:\/\/a4.mzstatic.com\/us\/r30\/Purple71\/v4\/d9\/91\/71\/d99171d9-0fb3-930f-3d78-1c0cdf8326e9\/screen696x696.jpeg",
        "http:\/\/a1.mzstatic.com\/us\/r30\/Purple62\/v4\/c1\/4f\/11\/c14f1147-0ea1-a0bc-04a1-139fe7fc800e\/screen696x696.jpeg"
      ],
      "artistViewUrl" : "https:\/\/itunes.apple.com\/us\/developer\/wechat\/id614694882?uo=4",
      "primaryGenreId" : 6005,
      "userRatingCount" : 33284,
      "averageUserRatingForCurrentVersion" : 3,
      "kind" : "software",
      "fileSizeBytes" : "158753792",
      "sellerUrl" : "http:\/\/www.wechat.com",
      "trackContentRating" : "12+",
      "bundleId" : "com.tencent.xin",
      "trackCensoredName" : "WeChat",
      "contentAdvisoryRating" : "12+",
      "isGameCenterEnabled" : false,
      "artistName" : "WeChat",
      "languageCodesISO2A" : [
        "AR",
        "ZH",
        "EN",
        "FR",
        "DE",
        "HE",
        "HI",
        "ID",
        "IT",
        "JA",
        "KO",
        "MS",
        "PL",
        "PT",
        "RU",
        "ZH",
        "ES",
        "TH",
        "ZH",
        "TR",
        "VI"
      ],
      "releaseNotes" : "Latest Updates:\n- Minor bug fixes.\n\nRecent Updates:\n- Group owner can verify members' invitation before they invite their friends to join the group.\n- Added Go Dutch to group chats allowing you to split bills quickly with your friends.\n- Send animated GIFs in chats.",
      "features" : [
        "iosUniversal"
      ],
      "averageUserRating" : 4.5,
      "wrapperType" : "software",
      "artworkUrl512" : "http:\/\/is5.mzstatic.com\/image\/thumb\/Purple71\/v4\/fe\/ed\/a1\/feeda179-73fc-0460-48c0-194997842dac\/source\/512x512bb.jpg",
      "artworkUrl100" : "http:\/\/is5.mzstatic.com\/image\/thumb\/Purple71\/v4\/fe\/ed\/a1\/feeda179-73fc-0460-48c0-194997842dac\/source\/100x100bb.jpg",
      "trackViewUrl" : "https:\/\/itunes.apple.com\/us\/app\/wechat\/id414478124?mt=8&uo=4",
      "formattedPrice" : "Free",
      "currency" : "USD",
      "ipadScreenshotUrls" : [
        "http:\/\/a5.mzstatic.com\/us\/r30\/Purple62\/v4\/54\/e2\/d4\/54e2d42b-0f4e-557e-02fe-9d710c1496f8\/sc1024x768.jpeg",
        "http:\/\/a1.mzstatic.com\/us\/r30\/Purple62\/v4\/20\/ac\/4e\/20ac4e52-411c-4599-2a2a-30b44a53b516\/sc1024x768.jpeg",
        "http:\/\/a2.mzstatic.com\/us\/r30\/Purple62\/v4\/73\/ec\/92\/73ec9245-8897-1be6-4bdb-3cee460212b8\/sc1024x768.jpeg",
        "http:\/\/a5.mzstatic.com\/us\/r30\/Purple71\/v4\/76\/b6\/9d\/76b69d42-54d4-115d-9db5-8e334fff1b46\/sc1024x768.jpeg"
      ]
    }
  ]
}
->->->->->->->->->->Response->->->->->->->->->xxxxxxxxxx requestMyServers(urlRequest: URLRequest(url: URL(string: "http://itunes.apple.com/US/lookup?id=414478124")!))?.responseMyServers(completionHandler: { (_) in})
```

### CGRect

```swift
var frame = CGRect(x: 10, y: 20, width: 30, height: 40)
print(frame.omX) // 10.0
frame.omX = 50
print(frame.omX) // 50.0
```

### UIAlertController

```swift
let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
alertController.om.show()
```

### UIApplaction

获取应用名称

```swift
print(UIApplication.omAppName) // OMExtensionDemo
```

获取应用外部版本号

```swift
print(UIApplication.omAppVersion) // 1.0
```

获取应用内部版本号

```swift
print(UIApplication.omAppBuild) // 1
```

获取应用唯一标识

```swift
print(UIApplication.omAppIdentifier) // com.octmon.OMExtensionDemo
```

获取应用名称delegate

```swift
print(UIApplication.omAppDelegate) // <OMExtensionDemo.AppDelegate: 0x7fdba3513720>
```

获取当前UIViewController

```swift
UIApplication.omCurrentVC
```

获取当前UINavigationController

```swift
UIApplication.omCurrentNC
```

获取当前UITabBarController

```swift
UIApplication.omCurrentTBC
```

手机震动

```swift
UIApplication.omSystemSoundVibrate()
```

手机播放系统声音

```swift
UIApplication.omSystemSoundPlay(.alarm) // OMSystemSoundID
```

手机播放自定义声音

```swift
UIApplication.omSystemSoundPlay("noticeMusic.caf")
```

跳转到系统设置

```swift
UIApplication.omOpenAppSettings() // 跳转到应用设置
UIApplication.omOpenPrefsAbout() // 跳转到关于本机
UIApplication.omOpenPrefsAccessibility() // 跳转到辅助功能
UIApplication.omOpenPrefsAirplane() // 跳转到飞行模式
UIApplication.omOpenPrefsAutoLock() // 跳转到自动锁定
UIApplication.omOpenPrefsDateTime() // 跳转到日期与时间
UIApplication.omOpenPrefsFaceTime() // 跳转到FaceTime
UIApplication.omOpenPrefsGeneral() // 跳转到通用
UIApplication.omOpenPrefsKeyboard() // 跳转到键盘
UIApplication.omOpenPrefsiCloud() // 跳转到iCloud
UIApplication.omOpenPrefsiCloudStorageBackup() // 跳转到iCloud储存空间
UIApplication.omOpenPrefsInternational() // 跳转到语言与地区
UIApplication.omOpenPrefsLocationServices() // 跳转到定位服务
UIApplication.omOpenPrefsMusic() // 跳转到音乐
UIApplication.omOpenPrefsNotes() // 跳转到备忘录
UIApplication.omOpenPrefsNotification() // 跳转到通知
UIApplication.omOpenPrefsPhone() // 跳转到电话
UIApplication.omOpenPrefsPhotos() // 跳转到照片与相机
UIApplication.omOpenPrefsProfile() // 跳转到描述文件
UIApplication.omOpenPrefsReset() // 跳转到还原
UIApplication.omOpenPrefsRingtone() // 跳转到电话铃声
UIApplication.omOpenPrefsSounds() // 跳转到声音
UIApplication.omOpenPrefsSoftwareUpdate() // 跳转到软件更新
UIApplication.omOpenPrefsStore() // 跳转到iTunes Store 与 App Store
UIApplication.omOpenPrefsTwitter() // 跳转到Twitter
UIApplication.omOpenPrefsVideo() // 跳转到视频
UIApplication.omOpenPrefsWallpaper() // 跳转到墙纸
UIApplication.omOpenPrefsWiFi() // 跳转到Wi-Fi
```

授权

```swift
// TouchID授权
UIApplication.omAuthenticationTouchID("TouchID授权测试", handler: { (result) -> Void in             
    print(result)
})
```

### UIBarButtonItem

点击回调

```swift
barButtonItem.omClickHandler {
    // 点击回调
}
```

### UIButton

点击回调

```swift
button.omAddTapGestureRecognizer { [weak self] (tapGestureRecognizer) in
    // 回调
}
```

开始菊花动画

```swift
button.omStartActivity()
```

停止菊花动画

```swift
button.omStopActivity()
```

### UIColor

创建颜色

```swift
print(UIColor(omHex: 0x123456)) // UIDeviceRGBColorSpace 0.0705882 0.203922 0.337255 1
print(UIColor(omHex: 0x666666, alpha: 0.5)) // UIDeviceRGBColorSpace 0.4 0.4 0.4 0.5
print(UIColor(omHex: "#00E079")) // UIDeviceRGBColorSpace 0 0.878431 0.47451 1
print(UIColor(omR: 128, G: 128, B: 128)) // UIDeviceRGBColorSpace 0.501961 0.501961 0.501961 1
print(UIColor(omR: 128, G: 128, B: 128, a: 0.5)) // UIDeviceRGBColorSpace 0.501961 0.501961 0.501961 0.5

let color = UIColor(omHex: 0x00E079)
print(color.omGetRed) // 0
print(color.omGetGreen) // 224
print(color.omGetBlue) // 121
print(color.omGetAlpha) // 1.0
print(color.omIsLight) // true
```

[中国传统色彩](CHINESE TRADITIONAL COLOR.md)

### UIDevice

设备型号

```swift
print(UIDevice.omName()) // x86_64
```

iPad判断

```swift
UIDevice.omIsPad
```

iPhone判断

```swift
UIDevice.omIsPhone
```

前面的摄像头是否可用

```swift
UIDevice.omIsAvailableCameraFront
```

后面的摄像头是否可用

```swift
UIDevice.omIsAvailableCameraRear
```

### UIFont

```swift
print(UIFont(omFontName: .helveticaNeueUltraLight, size: UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline).pointSize)) // Optional(<UICTFont: 0x7fcc21e214d0> font-family: "HelveticaNeue-UltraLight"; font-weight: normal; font-style: normal; font-size: 15.00pt)

print(UIFont.fontNamesForFamilyName(OMFamilyFontName.arial.rawValue)) // ["ArialMT", "Arial-BoldItalicMT", "Arial-BoldMT", "Arial-ItalicMT"]
```

### UIImage

创建二维码

```swift
print(UIImage(omColor: UIColor.red, frame: CGRect(x: 0, y: 0, width: 100, height: 100)) ?? "") // Optional(<UIImage: 0x7fcadb5ac110>, {100, 100})

print(UIImage(omBarcode: "123456789") ?? "") // Optional(<UIImage: 0x7ff25064c480>, {115, 46})
```

创建条形码

```swift
print(UIImage(omQRcode: "https://github.com/OctMon")) // Optional(<UIImage: 0x7ff250648b20>, {27, 27})
```

改变尺寸

```swift
var image = UIImage(omQRcode: "https://github.com/OctMon")
print(image ?? "")

image =  image?.om.resize(size: CGSize(width: 300, height: 300))
print(image ?? "")
```

获取应用启动图

```swift
UIImage.OM.launchImage
```

### UINavigationBar

隐藏导航阴影并透明

```swift
omNavigationBar?.om.setTransparent(transparent: true)
```

隐藏导航阴影不透明

```swift
omNavigationBar?.om.setTransparent(transparent: true, translucent: false)
```

### UIScreen

竖屏判断

```swift
print(UIScreen.OM.isPortrait) // true
```

frame

```swift
print(UIScreen.OM.bounds) // (0.0, 0.0, 414.0, 736.0)
print(UIScreen.OM.size) // (414.0, 736.0)
print(UIScreen.OM.width) // 414.0
print(UIScreen.OM.height) // 736.0
```

### UIStoryboard

通过Storyboard初始化一个UIViewController

```swift
UIStoryboard(omName: "Storyboard 文件名").instantiateViewController(withIdentifier: "Storyboard ID")
```

### UITableView

波浪动画

```swift
tableView.om.reloadAnimationWave()
```

### UITextField

限制长度

```swift
textField.om.addTextLimit(length: 3) {
    print("超出限制")
}
```

键盘右上角添加完成按钮收回键盘

```swift
textField.om.addDoneButton(barStyle: .default, title: "完成")
```

文本添加左边距

```swift
textField.om.addLeftSpace(padding: 50)
```

文本添加图标

```swift
textField.om.addLeftIcon(image: UIImage(named: "icon")!)
```

### UITextView

限制长度

```swift
textView.om.addTextLimit(length: 11)
```

键盘右上角添加完成按钮收回键盘

```swift
textView.om.addDoneButton(barStyle: .default, title: "完成")
```

### UIView

gestureRecognizer

```swift
imageView.om.addTapGestureRecognizer { [unowned self] (tapGestureRecognizer) in
    
    print(self.omClassName + "点按手势回调")
}
imageView.om.addLongPressGestureRecognizer { [unowned self] (longPressGestureRecognizer) in
    
    print(self.omClassName + "长按手势回调")
}
imageView.om.addPinchGestureRecognizer { [unowned self] (pinchGestureRecognizer) in
    
    print(self.omClassName + "捏合手势回调")
}
imageView.om.addSwipeGestureRecognizer(.left) { [unowned self] (swipeGestureRecognizer) in
    
    print(self.omClassName + "轻扫手势回调")
}
imageView.om.addPanGestureRecognizer { [unowned self] (panGestureRecognizer) in
    
    print(self.omClassName + "拖动手势回调")
}
```

frame

```swift
var view = UIView(omX: 15, y: 30, width: 100, height: 150)
print(view.om.x) // 15.0
print(view.om.y) // 30.0
print(view.om.width) // 100.0
print(view.om.height) // 150.0
view.om.x = 50
print(view.om.x) // 50.0
```

```swift
let view = UIView(omX: 10, y: 20, width: 100, height: 200)
print(view.om.top) // 20.0
print(view.om.bottom) // 220.0
print(view.om.left) // 10.0
print(view.om.right) // 110.0
print(view.om.centerX) // 60.0
print(view.om.centerY) // 120.0
print(view.om.origin) // (10.0, 20.0)
print(view.om.size) // (100.0, 200.0)
```

```swift
let view1 = UIView(omX: 0, y: 0, width: 100, height: 100)
let view2 = UIView(omX: view1.om.rightOffset(15.0), y: view1.om.bottomOffset(30), width: 100, height: 100)
print(view2.frame) // (115.0, 130.0, 100.0, 100.0)
```

border

```swift
view.om.addBorder()
view.om.addBorderBottom(size: 0.3, color: UIColor(omHex: 0xCCCCCC), padding: (0, 0))
view.om.addRoundedCorners()
view.om.addRoundedCorners(byRoundingCorners: .allCorners, cornerRadii: 10)
```

transform

```swift
view.om.transform3DScale(x: 0.8, y: 0.8)
view.om.transform3DRotationX(30)
```

animation

```swift
view.om.animationShake() // 摇一摇动画
view.om.animationHeartbeat(1) // 心跳动画
view.om.animationPulse(1) // 脉冲动画
```

screenshot

```swift
view.om.savedScreenshotPhotosAlbum() // 截图并保存到相册
view.om.getScreenshot() // 截图
```

### UIViewController

点击任意位置收回键盘

```swift
omDismissKeyboardWhenTapped()
```

收回键盘

```swift
omDismissKeyboardI()
```

添加/删除通知

```swift
omAddNotificationObserver("name", selector: #selector(MainTVC.omPopViewController(_:)))

omRemoveNotificationObserver()
omRemoveNotificationObserver("name")
```

设置背景图

```swift
omSetBackground(image: UIImage(named: "background")!)
```

监听截屏事件

```swift
omAddUserDidTakeScreenshotNotificationNotification { 
    // 回调
}
```

监听键盘事件

```swift
omAddKeyboardWillShowNotification()
omAddKeyboardWillHideNotification()
omAddKeyboardDidShowNotification()
omAddKeyboardDidHideNotification()

// 需要重写相应的方法
override func omKeyboardWillShowWithFrame(frame: CGRect) {

}

override func omKeyboardWillHideWithFrame(frame: CGRect) {

}

override func omKeyboardDidShowWithFrame(frame: CGRect) {

}

override func omKeyboardDidHideWithFrame(frame: CGRect) {

}
```

显示占位图

```swift
omShowPlaceholder(image, shouldTap: true, buttonBackgroundImages: [(backgroundImageNormal, state: UIControlState()), (backgroundImageHighlight, state: UIControlState.highlighted)], buttonTitles: (backgroundImageNormal != nil ? [(title.omGetAttributes(), UIControlState())] : nil), buttonTapHandler: { (button) in
	// 按钮点击回调
}, placeholderViewTapHandler: { 
    // 占位图点击回调
})
```

其它

```swift
omNavigationBar

omPushViewController(UIViewController(), animated: true)
omPopViewController(true)

omPresentViewController(UIViewController(), animated: true, completion: nil)
omDismissViewController()

omSetBackBarButtonItem("") // 设置返回按钮的文字
```
