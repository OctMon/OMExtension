//
//  SystemSoundTVC.swift
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

class SystemSoundTVC: BaseTVC {
    
    let dataSource = [
        OMSystemSoundID.newMail,
        OMSystemSoundID.mailSent,
        OMSystemSoundID.voiceMail,
        OMSystemSoundID.recivedMessage,
        OMSystemSoundID.sentMessage,
        OMSystemSoundID.alarm,
        OMSystemSoundID.lowPower,
        OMSystemSoundID.smsReceived1,
        OMSystemSoundID.smsReceived2,
        OMSystemSoundID.smsReceived3,
        OMSystemSoundID.smsReceived4,
        OMSystemSoundID.smsReceived5,
        OMSystemSoundID.smsReceived6,
        OMSystemSoundID.bloom,
        OMSystemSoundID.calypso,
        OMSystemSoundID.chooChoo,
        OMSystemSoundID.descent,
        OMSystemSoundID.fanfare,
        OMSystemSoundID.ladder,
        OMSystemSoundID.minuet,
        OMSystemSoundID.newsFlash,
        OMSystemSoundID.noir,
        OMSystemSoundID.sherwoodForest,
        OMSystemSoundID.spell,
        OMSystemSoundID.suspence,
        OMSystemSoundID.telegraph,
        OMSystemSoundID.tiptoes,
        OMSystemSoundID.typewriters,
        OMSystemSoundID.update,
        OMSystemSoundID.ussdAlert,
        OMSystemSoundID.simToolkitCallDropped,
        OMSystemSoundID.simToolkitGeneralBeep,
        OMSystemSoundID.simToolkitNegativeACK,
        OMSystemSoundID.simToolkitPositiveACK,
        OMSystemSoundID.simToolkitSMS,
        OMSystemSoundID.tink,
        OMSystemSoundID.ctBusy,
        OMSystemSoundID.ctCongestion,
        OMSystemSoundID.ctPathACK,
        OMSystemSoundID.ctError,
        OMSystemSoundID.ctCallWaiting,
        OMSystemSoundID.ctKeytone,
        OMSystemSoundID.lock,
        OMSystemSoundID.unlock,
        OMSystemSoundID.failedUnlock,
        OMSystemSoundID.keypressedTink,
        OMSystemSoundID.keypressedTock,
        OMSystemSoundID.tock,
        OMSystemSoundID.beepBeep,
        OMSystemSoundID.ringerCharged,
        OMSystemSoundID.photoShutter,
        OMSystemSoundID.shake,
        OMSystemSoundID.jblBegin,
        OMSystemSoundID.jblConfirm,
        OMSystemSoundID.jblCancel,
        OMSystemSoundID.beginRecording,
        OMSystemSoundID.endRecording,
        OMSystemSoundID.jblAmbiguous,
        OMSystemSoundID.jblNoMatch,
        OMSystemSoundID.beginVideoRecord,
        OMSystemSoundID.endVideoRecord,
        OMSystemSoundID.vcInvitationAccepted,
        OMSystemSoundID.vcRinging,
        OMSystemSoundID.vcEnded,
        OMSystemSoundID.vcCallWaiting,
        OMSystemSoundID.vcCallUpgrade,
        OMSystemSoundID.touchTone1,
        OMSystemSoundID.touchTone2,
        OMSystemSoundID.touchTone3,
        OMSystemSoundID.touchTone4,
        OMSystemSoundID.touchTone5,
        OMSystemSoundID.touchTone6,
        OMSystemSoundID.touchTone7,
        OMSystemSoundID.touchTone8,
        OMSystemSoundID.touchTone9,
        OMSystemSoundID.touchTone10,
        OMSystemSoundID.touchToneStar,
        OMSystemSoundID.touchTonePound,
        OMSystemSoundID.headsetStartCall,
        OMSystemSoundID.headsetRedial,
        OMSystemSoundID.headsetAnswerCall,
        OMSystemSoundID.headsetEndCall,
        OMSystemSoundID.headsetCallWaitingActions,
        OMSystemSoundID.headsetTransitionEnd,
        OMSystemSoundID.voicemail,
        OMSystemSoundID.receivedMessage,
        OMSystemSoundID.newMail2,
        OMSystemSoundID.mailSent2,
        OMSystemSoundID.alarm2,
        OMSystemSoundID.lock2,
        OMSystemSoundID.tock2,
        OMSystemSoundID.smsReceived1_2,
        OMSystemSoundID.smsReceived2_2,
        OMSystemSoundID.smsReceived3_2,
        OMSystemSoundID.smsReceived4_2,
        OMSystemSoundID.smsReceived1_3,
        OMSystemSoundID.smsReceived5_3,
        OMSystemSoundID.smsReceived6_3,
        OMSystemSoundID.voicemail2,
        OMSystemSoundID.anticipate2,
        OMSystemSoundID.bloom2,
        OMSystemSoundID.calypso2,
        OMSystemSoundID.chooChoo2,
        OMSystemSoundID.descent2,
        OMSystemSoundID.fanfare2,
        OMSystemSoundID.ladder2,
        OMSystemSoundID.minuet2,
        OMSystemSoundID.newsFlash2,
        OMSystemSoundID.noir2,
        OMSystemSoundID.sherwoodForest2,
        OMSystemSoundID.spell2,
        OMSystemSoundID.suspence2,
        OMSystemSoundID.telegraph2,
        OMSystemSoundID.tiptoes2,
        OMSystemSoundID.typewriters2,
        OMSystemSoundID.update2,
        OMSystemSoundID.ringerVibeChanged,
        OMSystemSoundID.silentVibeChanged,
        OMSystemSoundID.vibrate
    ]

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.omClassName, for: indexPath)
        
        cell.textLabel?.text = "\(dataSource[(indexPath as NSIndexPath).row])"
        cell.detailTextLabel?.text = "\(dataSource[(indexPath as NSIndexPath).row].rawValue)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        UIApplication.OM.playSystemSound(systemSoundID: dataSource[(indexPath as NSIndexPath).row])
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
