//
//  ApplicationTVC.swift
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

class ApplicationTVC: BaseTVC {
    
    @IBOutlet weak var label: UILabel!
    
    let dataSource = [
        ("跳转到系统设置", PrefsTVC.omClassName),
        ("跳转到其它", JumpOtherTVC.omClassName),
        ("系统授权", AuthenticationTVC.omClassName),
        ("播放系统声音", SystemSoundTVC.omClassName)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.numberOfLines = 0
        label.text = UIApplication.OM.appName + "\n" + UIApplication.OM.appIdentifier + "\n" + UIApplication.OM.appBuild + "\n" + UIApplication.OM.appVersion + "\n" + "\(UIApplication.OM.appDelegate)"
        
        label.om.addTapGestureRecognizer { [unowned self] (tapGestureRecognizer) in
            
            self.tableView.tableHeaderView?.backgroundColor = UIColor.OM.random
        }
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
        
        let vc = UIStoryboard(omName: UIApplication.omClassName).instantiateViewController(withIdentifier: dataSource[(indexPath as NSIndexPath).row].1)
        vc.title = dataSource[(indexPath as NSIndexPath).row].0
        
        om.pushViewController(vc)
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
