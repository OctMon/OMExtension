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
- [CGRect](#cgrect)
- [Dictionary](#dictionary)
- [Double](#double)
- [Int](#int)
- [String](#string)
- [Date](#date)
- [Thread](#thread)
- [Timer](#timer)
- [NSObject](#nsobject)

## UIKit

- [UIAlertController](#uialertController)
- [UIApplaction](#uiapplaction)
- [UIButton](#uibutton)
- [UIColor](#uicolor)
- [UIDevice](#uidevice)
- [UIFont](#uifont)
- [UIImage](#uiimage)
- [UINavigationBar](#uinavigationBar)
- [UIScreen](#uiscreen)
- [UIStoryboard](#uistoryboard)
- [UITableView](#uitableView)
- [UITextField](#uitextField)
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

### CGRect

```swift
var frame = CGRect(x: 10, y: 20, width: 30, height: 40)
print(frame.omX) // 10.0
frame.omX = 50
print(frame.omX) // 50.0
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

### NSObject

获取类型名称

```swift
print(NSObject.omClassName) // NSObject
print(UIApplication.sharedApplication().omClassName) // UIApplication
print(omDeinitLog) // ApplicationTVC♻️deinit
```

### UIAlertController

```swift
let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
alertController.omShow()
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

### UIButton

按钮点击回调

```swift
button.omAddTapGestureRecognizer { [weak self] (tapGestureRecognizer) in
    // 回调
}
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
print(UIImage(omColor: UIColor.redColor(), frame: CGRect(x: 0, y: 0, width: 100, height: 100))) // Optional(<UIImage: 0x7fcadb5ac110>, {100, 100})
print(UIImage(omBarcode: "123456789")) // Optional(<UIImage: 0x7ff25064c480>, {115, 46})
```

创建条形码

```swift
print(UIImage(omQRcode: "https://github.com/OctMon")) // Optional(<UIImage: 0x7ff250648b20>, {27, 27})
```

改变尺寸

```swift
var image = UIImage(omQRcode: "https://github.com/OctMon")
print(image)
image =  image?.omResize(CGSize(width: 300, height: 300))
print(image)
```

获取应用启动图

```swift
UIImage.omLaunchImage()
```

### UINavigationBar

隐藏导航阴影并透明

```swift
omNavigationBar?.omTransparent(true, translucent: false)
```

隐藏导航阴影不透明

```swift
omNavigationBar?.omTransparent(true)
```

### UIScreen

竖屏判断

```swift
print(UIScreen.omIsPortrait)
```

frame

```swift
print(UIScreen.omGetBounds) // (0.0, 0.0, 414.0, 736.0)
print(UIScreen.omGetSize) // (414.0, 736.0)
print(UIScreen.omGetWidth) // 414.0
print(UIScreen.omGetHeight) // 736.0
```

### UIStoryboard

通过Storyboard初始化一个UIViewController

```swift
UIStoryboard.omInstantiateViewController(name: "Storyboard 文件名", identifier: "Storyboard ID")
```

### UITableView

波浪动画

```swift
tableView.omReloadAnimationWithWave()
```

### UITextField

限制长度

```swift
textField.omSetLimit(11)
```

键盘右上角添加完成按钮收回键盘

```swift
textField.omAddDoneButton(.Default, title: "完成")
```

文本添加左边距

```swift
textField.omAddLeftPadding(15)
```

文本添加图标

```swift
textField.omAddLeftIcon(UIImage(named: "icon")!)
```

### UITextView

限制长度

```swift
textView.omSetLimit(11)
```

键盘右上角添加完成按钮收回键盘

```swift
textView.omAddDoneButton(.Default, title: "完成")
```

### UIView

手势回调

```swift
imageView.omAddTapGestureRecognizer { [weak self] (tapGestureRecognizer) in
    // 点按手势回调
}    
imageView.omAddLongPressGestureRecognizer { [weak self] (longPressGestureRecognizer) in
    // 长按手势回调
}
imageView.omAddPinchGestureRecognizer { [weak self] (pinchGestureRecognizer) in
    // 捏合手势回调
}
imageView.omAddSwipeGestureRecognizer(.Left) { [weak self] (swipeGestureRecognizer) in
    // 轻扫手势回调
}
imageView.omAddPanGestureRecognizer { [weak self] (panGestureRecognizer) in
    // 拖动手势回调
}
```





```swift
let view = UIView(omX: 15, y: 30, width: 100, height: 150)
print(view.omX) // 15.0
print(view.omY) // 30.0
print(view.omW) // 100.0
print(view.omH) // 150.0
view.omX = 50
print(view.omX) // 50.0
```



```swift
let view = UIView(omX: 10, y: 20, width: 100, height: 200)
print(view.omTop) // 20.0
print(view.omBottom) // 220.0 (omY + omH)
print(view.omLeft) // 10.0
print(view.omRight) // 110.0 (omX + omW)
print(view.omCenterX) // 60.0
print(view.omCenterY) // 120.0
print(view.omOrigin) // (10.0, 20.0)
print(view.omSize) // (100.0, 200.0)
```



```swift
let view1 = UIView(omX: 0, y: 0, width: 100, height: 100)
let view2 = UIView(omX: view1.rightOffset(15), y: view1.bottomOffset(30), width: 100, height: 100)
print(view2.frame) // (115.0, 130.0, 100.0, 100.0)
```



```swift
view.omAddBorder()
view.omAddBorderBottom(size: 0.3, color: UIColor(omHex: 0xCCCCCC), padding: (0, 0))
view.omRoundSquare()
view.omRoundCorner(.AllCorners, radius: 10)

view.omSetScale(x: 1.5, y: 1.5)
view.omSetRotationX(10)
```



```swift
view.omShakeAnimation() // 摇一摇动画
view.omHeartbeatAnimationWithDuration(1) // 心跳动画
view.omPulseAnimationWithDuration(1) // 脉冲动画
```



```swift
view.omScreenshotToSavedPhotosAlbum() // 截图并保存到相册
view.omScreenshotToImage() // 截图
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