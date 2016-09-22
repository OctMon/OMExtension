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
        ("跳转到应用设置", "omOpenAppSettings"),
        ("跳转到关于本机", "omOpenPrefsAbout"),
        ("跳转到辅助功能", "omOpenPrefsAccessibility"),
        ("跳转到飞行模式", "omOpenPrefsAirplane"),
        ("跳转到自动锁定", "omOpenPrefsAutoLock"),
        ("跳转到日期与时间", "omOpenPrefsDateTime"),
        ("跳转到FaceTime", "omOpenPrefsFaceTime"),
        ("跳转到通用", "omOpenPrefsGeneral"),
        ("跳转到键盘", "omOpenPrefsKeyboard"),
        ("跳转到iCloud", "omOpenPrefsiCloud"),
        ("跳转到iCloud储存空间", "omOpenPrefsiCloudStorageBackup"),
        ("跳转到语言与地区", "omOpenPrefsInternational"),
        ("跳转到定位服务", "omOpenPrefsLocationServices"),
        ("跳转到音乐", "omOpenPrefsMusic"),
        ("跳转到备忘录", "omOpenPrefsNotes"),
        ("跳转到通知", "omOpenPrefsNotification"),
        ("跳转到电话", "omOpenPrefsPhone"),
        ("跳转到照片与相机", "omOpenPrefsPhotos"),
        ("跳转到描述文件", "omOpenPrefsProfile"),
        ("跳转到还原", "omOpenPrefsReset"),
        ("跳转到电话铃声", "omOpenPrefsRingtone"),
        ("跳转到声音", "omOpenPrefsSounds"),
        ("跳转到软件更新", "omOpenPrefsSoftwareUpdate"),
        ("跳转到iTunes Store 与 App Store", "omOpenPrefsStore"),
        ("跳转到Twitter", "omOpenPrefsTwitter"),
        ("跳转到视频", "omOpenPrefsVideo"),
        ("跳转到墙纸", "omOpenPrefsWallpaper"),
        ("跳转到Wi-Fi", "omOpenPrefsWiFi"),
        ]
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(UITableViewCell.omClassName, forIndexPath: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row].0
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        UIApplication.performSelector(Selector(dataSource[indexPath.row].1), withObject: nil, afterDelay: 0)
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
