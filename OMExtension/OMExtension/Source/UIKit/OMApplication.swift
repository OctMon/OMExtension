//
//  OMApplication.swift
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

// MARK: - App
public extension UIApplication {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.appDelegate` instead.", renamed: "OM.appDelegate")
    /// 获取单例delegate
    static var omAppDelegate: UIApplicationDelegate { return OM.appDelegate }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.currentVC` instead.", renamed: "OM.currentVC")
    // 获取当前UIViewController
    static var omCurrentVC: UIViewController? {
        
        return OM.currentVC
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.currentNC` instead.", renamed: "OM.currentNC")
    // 获取当前UINavigationController
    static var omCurrentNC: UINavigationController? {
        
        return OM.currentNC
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.currentTBC` instead.", renamed: "OM.currentTBC")
    // 获取当前UITabBarController
    static var omCurrentTBC: UITabBarController? {
        
        return OM.currentTBC
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.appName` instead.", renamed: "OM.appName")
    /// 获取应用名称
    static var omAppName: String { return OM.appName }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.appIdentifier` instead.", renamed: "OM.appIdentifier")
    /// 获取应用唯一标识
    static var omAppIdentifier: String { return OM.appIdentifier }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.appBuild` instead.", renamed: "OM.appBuild")
    /// 获取应用内部版本号
    static var omAppBuild: String { return OM.appBuild }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.appVersion` instead.", renamed: "OM.appVersion")
    /// 获取应用外部版本号
    static var omAppVersion: String { return OM.appVersion }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.isFirstStart` instead.", renamed: "OM.isFirstStart")
    /// 是否存在一个以应用唯一标识为标记的key
    static var omIsFirstStart: Bool { return OM.isFirstStart }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.isFirstStartForCurrentBuild` instead.", renamed: "OM.isFirstStartForCurrentBuild")
    /// 是否存在一个以内部版本号为标记的key
    static var omIsFirstStartForCurrentBuild: Bool { return OM.isFirstStartForCurrentBuild }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.isFirstStartForCurrentVersion` instead.", renamed: "OM.isFirstStartForCurrentVersion")
    /// 是否存在一个以外部版本号为标记的key
    static var omIsFirstStartForCurrentVersion: Bool { return OM.isFirstStartForCurrentVersion }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.isFirstStartForKey` instead.", renamed: "OM.isFirstStartForKey")
    /**
     是否存在标记key，并保存key
     
     - parameter key: 标记key是否存在
     
     - returns: 是否存在标记key
     */
    static func omIsFirstStart(key: String) -> (Bool) {
        
        return OM.isFirstStartForKey(key)
    }
}

// MARK: - Prefs
public extension UIApplication {
    
//  http://stackoverflow.com/questions/8246070/ios-launching-settings-restrictions-url-scheme/8246814#8246814
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.canOpenURL` instead.", renamed: "OM.canOpenURL")
    /**
     是否可以打开URL (判断手机是否安装微信 需要在“Info.plist”中将要使用的URL Schemes列为白名单)
     
     - parameter string: e.g. weixin://
     
     - returns: 成功/失败
     */
    static func omCanOpenURL(string: String) -> Bool {
        
        return OM.canOpenURL(string: string)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openURL` instead.", renamed: "OM.openURL")
    /**
     在浏览器中打开URL (跳转微信 需要在“Info.plist”中将要使用的URL Schemes列为白名单)
     
     - parameter string: e.g. weixin://
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenURL(string: String) -> Bool {
        
        return OM.openURL(string: string)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.call` instead.", renamed: "OM.call")
    /// 打电话
    ///
    /// - Parameter telephone: 电话号码
    /// - Returns: 成功/失败
    @discardableResult
    static func omCall(telephone: String) -> Bool {
        
        return OM.call(telephone: telephone)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openAppStoreDetails` instead.", renamed: "OM.openAppStoreDetails")
    /// 跳转到appStore应用详情
    ///
    /// - Parameter id: 应该id
    /// - Returns: 成功/失败
    @discardableResult
    static func omOpenAppStoreDetails(id: Int) -> Bool {
        
        return OM.openAppStoreDetails(id: id)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openAppStoreReviews` instead.", renamed: "OM.openAppStoreReviews")
    /// 跳转到appStore应用评价
    ///
    /// - Parameter id: 应该id
    /// - Returns: 成功/失败
    @discardableResult
    static func omOpenAppStoreReviews(id: Int) -> Bool {
        
        return OM.openAppStoreReviews(id: id)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.getAppStoreURL` instead.", renamed: "OM.getAppStoreURL")
    /// 应用在appStore中的下载地址
    ///
    /// - Parameter id: 应该id
    /// - Returns: 成功/失败
    static func omGetAppStoreURL(id: Int) -> String { return OM.getAppStoreURL(id: id) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.getAppStoreLookupURL` instead.", renamed: "OM.getAppStoreLookupURL")
    /// 应用在appStore中的详情json的请求地址
    ///
    /// - Parameter id: 应该id
    /// - Returns: 成功/失败
    static func omGetAppStoreLookupURL(id: Int) -> String { return OM.getAppStoreLookupURL(id: id) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openAppSettings` instead.", renamed: "OM.openAppSettings")
    /**
     跳转到应用设置
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenAppSettings() -> Bool { return OM.openAppSettings() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsAbout` instead.", renamed: "OM.openPrefsAbout")
    /**
     跳转到关于本机
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsAbout() -> Bool { return OM.openPrefsAbout() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsAccessibility` instead.", renamed: "OM.openPrefsAccessibility")
    /**
     跳转到辅助功能
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsAccessibility() -> Bool { return OM.openPrefsAccessibility() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsAirplane` instead.", renamed: "OM.openPrefsAirplane")
    /**
     跳转到飞行模式
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsAirplane() -> Bool { return OM.openPrefsAirplane() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsAutoLock` instead.", renamed: "OM.openPrefsAutoLock")
    /**
     跳转到自动锁定
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsAutoLock() -> Bool { return OM.openPrefsAutoLock() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsDateTime` instead.", renamed: "OM.openPrefsDateTime")
    /**
     跳转到日期与时间
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsDateTime() -> Bool { return OM.openPrefsDateTime() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsFaceTime` instead.", renamed: "OM.openPrefsFaceTime")
    /**
     跳转到FaceTime
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsFaceTime() -> Bool { return OM.openPrefsFaceTime() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsGeneral` instead.", renamed: "OM.openPrefsGeneral")
    /**
     跳转到通用
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsGeneral() -> Bool { return OM.openPrefsGeneral() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsKeyboard` instead.", renamed: "OM.openPrefsKeyboard")
    /**
     跳转到键盘
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsKeyboard() -> Bool { return OM.openPrefsKeyboard() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsiCloud` instead.", renamed: "OM.openPrefsiCloud")
    /**
     跳转到iCloud
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsiCloud() -> Bool { return OM.openPrefsiCloud() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsiCloudStorageBackup` instead.", renamed: "OM.openPrefsiCloudStorageBackup")
    /**
     跳转到iCloud储存空间
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsiCloudStorageBackup() -> Bool { return OM.openPrefsiCloudStorageBackup() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsInternational` instead.", renamed: "OM.openPrefsInternational")
    /**
     跳转到语言与地区
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsInternational() -> Bool { return OM.openPrefsInternational() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsLocationServices` instead.", renamed: "OM.openPrefsLocationServices")
    /**
     跳转到定位服务
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsLocationServices() -> Bool { return OM.openPrefsLocationServices() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsMusic` instead.", renamed: "OM.openPrefsMusic")
    /**
     跳转到音乐
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsMusic() -> Bool { return OM.openPrefsMusic() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsNotes` instead.", renamed: "OM.openPrefsNotes")
    /**
     跳转到备忘录
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsNotes() -> Bool { return OM.openPrefsNotes() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsNotification` instead.", renamed: "OM.openPrefsNotification")
    /**
     跳转到通知
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsNotification() -> Bool { return OM.openPrefsNotification() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsPhone` instead.", renamed: "OM.openPrefsPhone")
    /**
     跳转到电话
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsPhone() -> Bool { return OM.openPrefsPhone() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsPhotos` instead.", renamed: "OM.openPrefsPhotos")
    /**
     跳转到照片与相机
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsPhotos() -> Bool { return OM.openPrefsPhotos() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsProfile` instead.", renamed: "OM.openPrefsProfile")
    /**
     跳转到描述文件
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsProfile() -> Bool { return OM.openPrefsProfile() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsReset` instead.", renamed: "OM.openPrefsReset")
    /**
     跳转到还原
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsReset() -> Bool { return OM.openPrefsReset() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsRingtone` instead.", renamed: "OM.openPrefsRingtone")
    /**
     跳转到电话铃声
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsRingtone() -> Bool { return OM.openPrefsRingtone() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsSounds` instead.", renamed: "OM.openPrefsSounds")
    /**
     跳转到声音
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsSounds() -> Bool { return OM.openPrefsSounds() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsSoftwareUpdate` instead.", renamed: "OM.openPrefsSoftwareUpdate")
    /**
     跳转到软件更新
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsSoftwareUpdate() -> Bool { return OM.openPrefsSoftwareUpdate() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsStore` instead.", renamed: "OM.openPrefsStore")
    /**
     跳转到iTunes Store 与 App Store
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsStore() -> Bool { return OM.openPrefsStore() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsTwitter` instead.", renamed: "OM.openPrefsTwitter")
    /**
     跳转到Twitter
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsTwitter() -> Bool { return OM.openPrefsTwitter() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsVideo` instead.", renamed: "OM.openPrefsVideo")
    /**
     跳转到视频
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsVideo() -> Bool { return OM.openPrefsVideo() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsWallpaper` instead.", renamed: "OM.openPrefsWallpaper")
    /**
     跳转到墙纸
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsWallpaper() -> Bool { return OM.openPrefsWallpaper() }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.openPrefsWiFi` instead.", renamed: "OM.openPrefsWiFi")
    /**
     跳转到Wi-Fi
     
     - returns: 成功/失败
     */
    @discardableResult
    static func omOpenPrefsWiFi() -> Bool { return OM.openPrefsWiFi() }

}

// MARK: - Audio

/**
 http://iphonedevwiki.net/index.php/AudioServices
 */
public enum OMSystemSoundID: Int {
    case newMail = 1000
    case mailSent = 1001
    case voiceMail = 1002
    case recivedMessage = 1003
    case sentMessage = 1004
    case alarm = 1005
    case lowPower = 1006
    case smsReceived1 = 1007
    case smsReceived2 = 1008
    case smsReceived3 = 1009
    case smsReceived4 = 1010
    case smsReceived5 = 1013
    case smsReceived6 = 1014
    case tweetSent = 1016
    case anticipate = 1020
    case bloom = 1021
    case calypso = 1022
    case chooChoo = 1023
    case descent = 1024
    case fanfare = 1025
    case ladder = 1026
    case minuet = 1027
    case newsFlash = 1028
    case noir = 1029
    case sherwoodForest = 1030
    case spell = 1031
    case suspence = 1032
    case telegraph = 1033
    case tiptoes = 1034
    case typewriters = 1035
    case update = 1036
    case ussdAlert = 1050
    case simToolkitCallDropped = 1051
    case simToolkitGeneralBeep = 1052
    case simToolkitNegativeACK = 1053
    case simToolkitPositiveACK = 1054
    case simToolkitSMS = 1055
    case tink = 1057
    case ctBusy = 1070
    case ctCongestion = 1071
    case ctPathACK = 1072
    case ctError = 1073
    case ctCallWaiting = 1074
    case ctKeytone = 1075
    case lock = 1100
    case unlock = 1101
    case failedUnlock = 1102
    case keypressedTink = 1103
    case keypressedTock = 1104
    case tock = 1105
    case beepBeep = 1106
    case ringerCharged = 1107
    case photoShutter = 1108
    case shake = 1109
    case jblBegin = 1110
    case jblConfirm = 1111
    case jblCancel = 1112
    case beginRecording = 1113
    case endRecording = 1114
    case jblAmbiguous = 1115
    case jblNoMatch = 1116
    case beginVideoRecord = 1117
    case endVideoRecord = 1118
    case vcInvitationAccepted = 1150
    case vcRinging = 1151
    case vcEnded = 1152
    case vcCallWaiting = 1153
    case vcCallUpgrade = 1154
    case touchTone1 = 1200
    case touchTone2 = 1201
    case touchTone3 = 1202
    case touchTone4 = 1203
    case touchTone5 = 1204
    case touchTone6 = 1205
    case touchTone7 = 1206
    case touchTone8 = 1207
    case touchTone9 = 1208
    case touchTone10 = 1209
    case touchToneStar = 1210
    case touchTonePound = 1211
    case headsetStartCall = 1254
    case headsetRedial = 1255
    case headsetAnswerCall = 1256
    case headsetEndCall = 1257
    case headsetCallWaitingActions = 1258
    case headsetTransitionEnd = 1259
    case voicemail = 1300
    case receivedMessage = 1301
    case newMail2 = 1302
    case mailSent2 = 1303
    case alarm2 = 1304
    case lock2 = 1305
    case tock2 = 1306
    case smsReceived1_2 = 1307
    case smsReceived2_2 = 1308
    case smsReceived3_2 = 1309
    case smsReceived4_2 = 1310
    case smsReceivedVibrate = 1311
    case smsReceived1_3 = 1312
    case smsReceived5_3 = 1313
    case smsReceived6_3 = 1314
    case voicemail2 = 1315
    case anticipate2 = 1320
    case bloom2 = 1321
    case calypso2 = 1322
    case chooChoo2 = 1323
    case descent2 = 1324
    case fanfare2 = 1325
    case ladder2 = 1326
    case minuet2 = 1327
    case newsFlash2 = 1328
    case noir2 = 1329
    case sherwoodForest2 = 1330
    case spell2 = 1331
    case suspence2 = 1332
    case telegraph2 = 1333
    case tiptoes2 = 1334
    case typewriters2 = 1335
    case update2 = 1336
    case ringerVibeChanged = 1350
    case silentVibeChanged = 1351
    case vibrate = 4095
}

import AudioToolbox

public extension UIApplication {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.playSystemSound` instead.", renamed: "OM.playSystemSound")
    static func omSystemSoundPlay(_ omAudioSystemSoundID: OMSystemSoundID) {
        
        OM.playSystemSound(systemSoundID: omAudioSystemSoundID)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.playVibrate` instead.", renamed: "OM.playVibrate")
    static func omSystemSoundVibrate() {
        
        OM.playVibrate()
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.playSound` instead.", renamed: "OM.playSound")
    static func omSystemSoundPlay(_ forResource: String) {
        
        OM.playSound(forResource: forResource)
    }

}

// MARK: - Authentication

import LocalAuthentication

public enum OMAuthenticationTouchID: Int {
    case success
    case error
    case authenticationFailed
    case userCancel
    case userFallback
    case systemCancel
    case passcodeNotSet
    case touchIDNotAvailable
    case touchIDNotEnrolled
}

public extension UIApplication {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIApplication.OM.authenticationTouchID` instead.", renamed: "OM.authenticationTouchID")
    static func omAuthenticationTouchID(_ reason: String, handler: @escaping (_ result: OMAuthenticationTouchID) -> Void) {
        
        let context: LAContext = LAContext()
        
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: { (success: Bool, error: NSError?) -> Void in
                
                if success {
                    
                    handler(.success)
                    
                } else {
                    
                    switch error!.code {
                    case LAError.Code.authenticationFailed.rawValue:
                        handler(.authenticationFailed)
                    case LAError.Code.userCancel.rawValue:
                        handler(.userCancel)
                    case LAError.Code.userFallback.rawValue:
                        handler(.userFallback)
                    case LAError.Code.systemCancel.rawValue:
                        handler(.systemCancel)
                    default:
                        handler(.error)
                    }
                }
            } as! (Bool, Error?) -> Void)
            
        } else {
            
            switch error!.code {
            case LAError.Code.passcodeNotSet.rawValue:
                handler(.passcodeNotSet)
            case LAError.Code.touchIDNotAvailable.rawValue:
                handler(.touchIDNotAvailable)
            case LAError.Code.touchIDNotEnrolled.rawValue:
                handler(.touchIDNotEnrolled)
            default:
                handler(.error)
            }
        }
    }
}

public extension UIApplication {
    
    struct OM {
        
        /// 获取单例delegate
        public static var appDelegate: UIApplicationDelegate { return UIApplication.shared.delegate! }
        
        // 获取当前UIViewController
        public static var currentVC: UIViewController? {
            
            var top = UIApplication.shared.keyWindow?.rootViewController
            
            if top?.isKind(of: UITabBarController.classForCoder()) == true {
                
                top = (top as! UITabBarController).selectedViewController
                
                if (top?.isKind(of: UINavigationController.classForCoder()) == true) && (top as! UINavigationController).topViewController != nil {
                    
                    top = (top as! UINavigationController).topViewController
                }
                
            } else if top?.presentedViewController != nil {
                
                top = top?.presentedViewController
                
            } else if (top?.isKind(of: UINavigationController.classForCoder()) == true) && (top as! UINavigationController).topViewController != nil {
                
                top = (top as! UINavigationController).topViewController
            }
            
            return top
        }
        
        // 获取当前UINavigationController
        public static var currentNC: UINavigationController? {
            
            if let current = OM.currentVC {
                
                return current.navigationController
            }
            
            return nil
        }
        
        // 获取当前UITabBarController
        public static var currentTBC: UITabBarController? {
            
            if let top = UIApplication.shared.keyWindow?.rootViewController , top.isKind(of: UITabBarController.classForCoder()) == true {
                
                return (top as! UITabBarController)
            }
            
            return nil
        }
        
        /// 获取应用名称
        public static var appName: String { return Bundle.main.infoDictionary!["CFBundleName"] as! String }
        
        /// 获取应用唯一标识
        public static var appIdentifier: String { return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String }
        
        /// 获取应用内部版本号
        public static var appBuild: String { return Bundle.main.infoDictionary!["CFBundleVersion"] as! String }
        
        /// 获取应用外部版本号
        public static var appVersion: String { return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String }
        
        /// 是否存在一个以应用唯一标识为标记的key
        public static var isFirstStart: Bool { return OM.isFirstStartForKey(OM.appIdentifier) }
        
        /// 是否存在一个以内部版本号为标记的key
        public static var isFirstStartForCurrentBuild: Bool { return OM.isFirstStartForKey(OM.appIdentifier) }
        
        /// 是否存在一个以外部版本号为标记的key
        public static var isFirstStartForCurrentVersion: Bool { return OM.isFirstStartForKey(OM.appVersion) }
        
        /**
         是否存在标记key，并保存key
         
         - parameter key: 标记key是否存在
         
         - returns: 是否存在标记key
         */
        public static func isFirstStartForKey(_ key: String) -> (Bool) {
            
            let defaults = UserDefaults.standard
            let isFirstStart: Bool = defaults.bool(forKey: key)
            
            defaults.set(true, forKey: key)
            defaults.synchronize()
            
            if isFirstStart != true {
                
                return true
                
            } else {
                
                return false
            }
        }
        
        //  http://stackoverflow.com/questions/8246070/ios-launching-settings-restrictions-url-scheme/8246814#8246814
        
        fileprivate static let prefsRoot = "prefs:root="
        fileprivate static let generalPath = "General&path="
        
        fileprivate static func openPrefsRoot(_ string: String) -> Bool { return openURL(string: UIApplication.OM.prefsRoot + string) }
        
        fileprivate static func openGeneralPath(_ string: String) -> Bool { return openURL(string: UIApplication.OM.prefsRoot + UIApplication.OM.generalPath + string) }
        
        /**
         是否可以打开URL (判断手机是否安装微信 需要在“Info.plist”中将要使用的URL Schemes列为白名单)
         
         - parameter string: e.g. weixin://
         
         - returns: 成功/失败
         */
        public static func canOpenURL(string: String) -> Bool {
            
            if let url = URL(string: string) {
                
                return shared.canOpenURL(url)
            }
            
            return false
        }
        
        /**
         在浏览器中打开URL (跳转微信 需要在“Info.plist”中将要使用的URL Schemes列为白名单)
         
         - parameter string: e.g. weixin://
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openURL(string: String) -> Bool {
            
            if let url = URL(string: string) {
                
                return shared.openURL(url)
            }
            
            return false
        }
        
        /// 打电话
        ///
        /// - Parameter telephone: 电话号码
        /// - Returns: 成功/失败
        @discardableResult
        public static func call(telephone: String) -> Bool {
            
            guard telephone.characters.count > 0 else {
                
                return false
            }
            
            return openURL(string: "telprompt:\(telephone)")
        }
        
        /// 跳转到appStore应用详情
        ///
        /// - Parameter id: 应该id
        /// - Returns: 成功/失败
        @discardableResult
        public static func openAppStoreDetails(id: Int) -> Bool {
            
            return openURL(string: "itms-apps://itunes.apple.com/app/id\(id)")
        }
        
        /// 跳转到appStore应用评价
        ///
        /// - Parameter id: 应该id
        /// - Returns: 成功/失败
        @discardableResult
        public static func openAppStoreReviews(id: Int) -> Bool {
            
            return openURL(string: "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=\(id)")
        }
        
        /// 应用在appStore中的下载地址
        ///
        /// - Parameter id: 应该id
        /// - Returns: 成功/失败
        public static func getAppStoreURL(id: Int) -> String { return "http://itunes.apple.com/app/id\(id)" }
        
        /// 应用在appStore中的详情json的请求地址
        ///
        /// - Parameter id: 应该id
        /// - Returns: 成功/失败
        public static func getAppStoreLookupURL(id: Int) -> String { return "http://itunes.apple.com/US/lookup?id=\(id)" }
        
        /**
         跳转到应用设置
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openAppSettings() -> Bool { return openURL(string: UIApplicationOpenSettingsURLString) }
        
        /**
         跳转到关于本机
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsAbout() -> Bool { return openGeneralPath("About") }
        
        /**
         跳转到辅助功能
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsAccessibility() -> Bool { return openGeneralPath("ACCESSIBILITY") }
        
        /**
         跳转到飞行模式
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsAirplane() -> Bool { return openPrefsRoot("AIRPLANE_MODE") }
        
        /**
         跳转到自动锁定
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsAutoLock() -> Bool { return openGeneralPath("AUTOLOCK") }
        
        /**
         跳转到日期与时间
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsDateTime() -> Bool { return openGeneralPath("DATE_AND_TIME") }
        
        /**
         跳转到FaceTime
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsFaceTime() -> Bool { return openPrefsRoot("FACETIME") }
        
        /**
         跳转到通用
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsGeneral() -> Bool { return openPrefsRoot("General") }
        
        /**
         跳转到键盘
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsKeyboard() -> Bool { return openGeneralPath("Keyboard") }
        
        /**
         跳转到iCloud
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsiCloud() -> Bool { return openPrefsRoot("CASTLE") }
        
        /**
         跳转到iCloud储存空间
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsiCloudStorageBackup() -> Bool { return openPrefsRoot("CASTLE&path=STORAGE_AND_BACKUP") }
        
        /**
         跳转到语言与地区
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsInternational() -> Bool { return openGeneralPath("INTERNATIONAL") }
        
        /**
         跳转到定位服务
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsLocationServices() -> Bool { return openPrefsRoot("LOCATION_SERVICES") }
        
        /**
         跳转到音乐
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsMusic() -> Bool { return openPrefsRoot("MUSIC") }
        
        /**
         跳转到备忘录
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsNotes() -> Bool { return openPrefsRoot("NOTES") }
        
        /**
         跳转到通知
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsNotification() -> Bool { return openPrefsRoot("NOTIFICATIONS_ID") }
        
        /**
         跳转到电话
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsPhone() -> Bool { return openPrefsRoot("Phone") }
        
        /**
         跳转到照片与相机
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsPhotos() -> Bool { return openPrefsRoot("Photos") }
        
        /**
         跳转到描述文件
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsProfile() -> Bool { return openGeneralPath("ManagedConfigurationList") }
        
        /**
         跳转到还原
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsReset() -> Bool { return openGeneralPath("Reset") }
        
        /**
         跳转到电话铃声
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsRingtone() -> Bool { return openPrefsRoot("Sounds&path=Ringtone") }
        
        /**
         跳转到声音
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsSounds() -> Bool { return openPrefsRoot("Sounds") }
        
        /**
         跳转到软件更新
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsSoftwareUpdate() -> Bool { return openGeneralPath("SOFTWARE_UPDATE_LINK") }
        
        /**
         跳转到iTunes Store 与 App Store
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsStore() -> Bool { return openPrefsRoot("STORE") }
        
        /**
         跳转到Twitter
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsTwitter() -> Bool { return openPrefsRoot("TWITTER") }
        
        /**
         跳转到视频
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsVideo() -> Bool { return openPrefsRoot("VIDEO") }
        
        /**
         跳转到墙纸
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsWallpaper() -> Bool { return openPrefsRoot("Wallpaper") }
        
        /**
         跳转到Wi-Fi
         
         - returns: 成功/失败
         */
        @discardableResult
        public static func openPrefsWiFi() -> Bool { return openPrefsRoot("WIFI") }
        
        public static func playSystemSound(systemSoundID: OMSystemSoundID) {
            
            AudioServicesPlaySystemSound(SystemSoundID(systemSoundID.rawValue))
        }
        
        public static func playVibrate() {
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        
        public static func playSound(forResource: String) {
            
            guard let soundPath = Bundle.main.path(forResource: forResource, ofType: nil) else { return }
            guard let soundUrl = URL(string: soundPath) else { return }
            
            var soundID: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
        
        public static func authenticationTouchID(reason: String, handler: @escaping (Bool, LAError?) -> Void) {
            
            let context: LAContext = LAContext()
            
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: { (success, error) in
                    
                    handler(success, error as? LAError)
                })
                
            } else {
                
                handler(false, error as? LAError)
            }
        }
    }
}
