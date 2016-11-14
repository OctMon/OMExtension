//
//  JumpOtherTVC.swift
//  OMExtensionDemo
//
//  Created by OctMon on 2016/11/8.
//  Copyright © 2016年 OctMon. All rights reserved.
//

import UIKit

class JumpOtherTVC: BaseTVC {

    let dataSource = [
        ("检测是否安装微信", "canOpenWeixin"),
        ("打开微信", "openWeixin"),
        ("打电话", "callTelephone"),
        ("跳转到appStroe微信应用详情", "openAppStoreDetails"),
        ("跳转到appStroe微信应用评价", "openAppStoreReviews"),
        ("应用在appStroe中的地址", "getAppStoreURL"),
        ("应用在appStroe中的详情json的请求地址", "getAppStoreLookupURL"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(title: String) {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        alert.om.show()
    }
    
    func canOpenWeixin() {
        
        let canOpen = UIApplication.OM.canOpenURL(string: "weixin://")
        
        showAlert(title: "\(canOpen)")
    }
    
    func openWeixin() {
        
        UIApplication.OM.openURL(string: "weixin://")
    }
    
    func callTelephone() {
        
        UIApplication.OM.call(telephone: "112")
    }
    
    func openAppStoreDetails() {
        
        UIApplication.OM.openAppStoreDetails(id: 414478124)
    }
    
    func openAppStoreReviews() {
        
        UIApplication.OM.openAppStoreReviews(id: 414478124)
    }
    
    func getAppStoreURL() {
        
        showAlert(title: UIApplication.OM.getAppStoreURL(id: 414478124))
    }
    
    func getAppStoreLookupURL() {
        
        showAlert(title: UIApplication.OM.getAppStoreLookupURL(id: 414478124))
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.omClassName, for: indexPath)
        
        cell.textLabel?.text = dataSource[(indexPath as NSIndexPath).row].0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        perform(Selector(dataSource[(indexPath as NSIndexPath).row].1), with: nil, afterDelay: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
