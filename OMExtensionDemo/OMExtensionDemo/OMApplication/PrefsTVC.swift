//
//  PrefsTVC.swift
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

class PrefsTVC: BaseTVC {

    let dataSource = [
        ("跳转到应用设置", "OM.openAppSettings"),
        ("跳转到关于本机", "OM.openPrefsAbout"),
        ("跳转到辅助功能", "OM.openPrefsAccessibility"),
        ("跳转到飞行模式", "OM.openPrefsAirplane"),
        ("跳转到自动锁定", "OM.openPrefsAutoLock"),
        ("跳转到日期与时间", "OM.openPrefsDateTime"),
        ("跳转到FaceTime", "OM.openPrefsFaceTime"),
        ("跳转到通用", "OM.openPrefsGeneral"),
        ("跳转到键盘", "OM.openPrefsKeyboard"),
        ("跳转到iCloud", "OM.openPrefsiCloud"),
        ("跳转到iCloud储存空间", "OM.openPrefsiCloudStorageBackup"),
        ("跳转到语言与地区", "OM.openPrefsInternational"),
        ("跳转到定位服务", "OM.openPrefsLocationServices"),
        ("跳转到音乐", "OM.openPrefsMusic"),
        ("跳转到备忘录", "OM.openPrefsNotes"),
        ("跳转到通知", "OM.openPrefsNotification"),
        ("跳转到电话", "OM.openPrefsPhone"),
        ("跳转到照片与相机", "OM.openPrefsPhotos"),
        ("跳转到描述文件", "OM.openPrefsProfile"),
        ("跳转到还原", "OM.openPrefsReset"),
        ("跳转到电话铃声", "OM.openPrefsRingtone"),
        ("跳转到声音", "OM.openPrefsSounds"),
        ("跳转到软件更新", "OM.openPrefsSoftwareUpdate"),
        ("跳转到iTunes Store 与 App Store", "OM.openPrefsStore"),
        ("跳转到Twitter", "OM.openPrefsTwitter"),
        ("跳转到视频", "OM.openPrefsVideo"),
        ("跳转到墙纸", "OM.openPrefsWallpaper"),
        ("跳转到Wi-Fi", "OM.openPrefsWiFi"),
        ]
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.omClassName, for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row].0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            UIApplication.OM.openAppSettings()
        case 1:
            UIApplication.OM.openPrefsAbout()
        case 2:
            UIApplication.OM.openPrefsAccessibility()
        case 3:
            UIApplication.OM.openPrefsAirplane()
        case 4:
            UIApplication.OM.openPrefsAutoLock()
        case 5:
            UIApplication.OM.openPrefsDateTime()
        case 6:
            UIApplication.OM.openPrefsFaceTime()
        case 7:
            UIApplication.OM.openPrefsGeneral()
        case 8:
            UIApplication.OM.openPrefsKeyboard()
        case 9:
            UIApplication.OM.openPrefsiCloud()
        case 10:
            UIApplication.OM.openPrefsiCloudStorageBackup()
        case 11:
            UIApplication.OM.openPrefsInternational()
        case 12:
            UIApplication.OM.openPrefsLocationServices()
        case 13:
            UIApplication.OM.openPrefsMusic()
        case 14:
            UIApplication.OM.openPrefsNotes()
        case 15:
            UIApplication.OM.openPrefsNotification()
        case 16:
            UIApplication.OM.openPrefsPhone()
        case 17:
            UIApplication.OM.openPrefsPhotos()
        case 18:
            UIApplication.OM.openPrefsProfile()
        case 19:
            UIApplication.OM.openPrefsReset()
        case 20:
            UIApplication.OM.openPrefsRingtone()
        case 21:
            UIApplication.OM.openPrefsSounds()
        case 22:
            UIApplication.OM.openPrefsSoftwareUpdate()
        case 23:
            UIApplication.OM.openPrefsStore()
        case 24:
            UIApplication.OM.openPrefsTwitter()
        case 25:
            UIApplication.OM.openPrefsVideo()
        case 26:
            UIApplication.OM.openPrefsWallpaper()
        case 27:
            UIApplication.OM.openPrefsWiFi()
        default:
            break
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
