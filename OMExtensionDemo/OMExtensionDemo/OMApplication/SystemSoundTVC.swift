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
        UIApplication.OM.SoundID.newMail,
        UIApplication.OM.SoundID.mailSent,
        UIApplication.OM.SoundID.voiceMail,
        UIApplication.OM.SoundID.recivedMessage,
        UIApplication.OM.SoundID.sentMessage,
        UIApplication.OM.SoundID.alarm,
        UIApplication.OM.SoundID.lowPower,
        UIApplication.OM.SoundID.smsReceived1,
        UIApplication.OM.SoundID.smsReceived2,
        UIApplication.OM.SoundID.smsReceived3,
        UIApplication.OM.SoundID.smsReceived4,
        UIApplication.OM.SoundID.smsReceived5,
        UIApplication.OM.SoundID.smsReceived6,
        UIApplication.OM.SoundID.bloom,
        UIApplication.OM.SoundID.calypso,
        UIApplication.OM.SoundID.chooChoo,
        UIApplication.OM.SoundID.descent,
        UIApplication.OM.SoundID.fanfare,
        UIApplication.OM.SoundID.ladder,
        UIApplication.OM.SoundID.minuet,
        UIApplication.OM.SoundID.newsFlash,
        UIApplication.OM.SoundID.noir,
        UIApplication.OM.SoundID.sherwoodForest,
        UIApplication.OM.SoundID.spell,
        UIApplication.OM.SoundID.suspence,
        UIApplication.OM.SoundID.telegraph,
        UIApplication.OM.SoundID.tiptoes,
        UIApplication.OM.SoundID.typewriters,
        UIApplication.OM.SoundID.update,
        UIApplication.OM.SoundID.ussdAlert,
        UIApplication.OM.SoundID.simToolkitCallDropped,
        UIApplication.OM.SoundID.simToolkitGeneralBeep,
        UIApplication.OM.SoundID.simToolkitNegativeACK,
        UIApplication.OM.SoundID.simToolkitPositiveACK,
        UIApplication.OM.SoundID.simToolkitSMS,
        UIApplication.OM.SoundID.tink,
        UIApplication.OM.SoundID.ctBusy,
        UIApplication.OM.SoundID.ctCongestion,
        UIApplication.OM.SoundID.ctPathACK,
        UIApplication.OM.SoundID.ctError,
        UIApplication.OM.SoundID.ctCallWaiting,
        UIApplication.OM.SoundID.ctKeytone,
        UIApplication.OM.SoundID.lock,
        UIApplication.OM.SoundID.unlock,
        UIApplication.OM.SoundID.failedUnlock,
        UIApplication.OM.SoundID.keypressedTink,
        UIApplication.OM.SoundID.keypressedTock,
        UIApplication.OM.SoundID.tock,
        UIApplication.OM.SoundID.beepBeep,
        UIApplication.OM.SoundID.ringerCharged,
        UIApplication.OM.SoundID.photoShutter,
        UIApplication.OM.SoundID.shake,
        UIApplication.OM.SoundID.jblBegin,
        UIApplication.OM.SoundID.jblConfirm,
        UIApplication.OM.SoundID.jblCancel,
        UIApplication.OM.SoundID.beginRecording,
        UIApplication.OM.SoundID.endRecording,
        UIApplication.OM.SoundID.jblAmbiguous,
        UIApplication.OM.SoundID.jblNoMatch,
        UIApplication.OM.SoundID.beginVideoRecord,
        UIApplication.OM.SoundID.endVideoRecord,
        UIApplication.OM.SoundID.vcInvitationAccepted,
        UIApplication.OM.SoundID.vcRinging,
        UIApplication.OM.SoundID.vcEnded,
        UIApplication.OM.SoundID.vcCallWaiting,
        UIApplication.OM.SoundID.vcCallUpgrade,
        UIApplication.OM.SoundID.touchTone1,
        UIApplication.OM.SoundID.touchTone2,
        UIApplication.OM.SoundID.touchTone3,
        UIApplication.OM.SoundID.touchTone4,
        UIApplication.OM.SoundID.touchTone5,
        UIApplication.OM.SoundID.touchTone6,
        UIApplication.OM.SoundID.touchTone7,
        UIApplication.OM.SoundID.touchTone8,
        UIApplication.OM.SoundID.touchTone9,
        UIApplication.OM.SoundID.touchTone10,
        UIApplication.OM.SoundID.touchToneStar,
        UIApplication.OM.SoundID.touchTonePound,
        UIApplication.OM.SoundID.headsetStartCall,
        UIApplication.OM.SoundID.headsetRedial,
        UIApplication.OM.SoundID.headsetAnswerCall,
        UIApplication.OM.SoundID.headsetEndCall,
        UIApplication.OM.SoundID.headsetCallWaitingActions,
        UIApplication.OM.SoundID.headsetTransitionEnd,
        UIApplication.OM.SoundID.voicemail,
        UIApplication.OM.SoundID.receivedMessage,
        UIApplication.OM.SoundID.newMail2,
        UIApplication.OM.SoundID.mailSent2,
        UIApplication.OM.SoundID.alarm2,
        UIApplication.OM.SoundID.lock2,
        UIApplication.OM.SoundID.tock2,
        UIApplication.OM.SoundID.smsReceived1_2,
        UIApplication.OM.SoundID.smsReceived2_2,
        UIApplication.OM.SoundID.smsReceived3_2,
        UIApplication.OM.SoundID.smsReceived4_2,
        UIApplication.OM.SoundID.smsReceived1_3,
        UIApplication.OM.SoundID.smsReceived5_3,
        UIApplication.OM.SoundID.smsReceived6_3,
        UIApplication.OM.SoundID.voicemail2,
        UIApplication.OM.SoundID.anticipate2,
        UIApplication.OM.SoundID.bloom2,
        UIApplication.OM.SoundID.calypso2,
        UIApplication.OM.SoundID.chooChoo2,
        UIApplication.OM.SoundID.descent2,
        UIApplication.OM.SoundID.fanfare2,
        UIApplication.OM.SoundID.ladder2,
        UIApplication.OM.SoundID.minuet2,
        UIApplication.OM.SoundID.newsFlash2,
        UIApplication.OM.SoundID.noir2,
        UIApplication.OM.SoundID.sherwoodForest2,
        UIApplication.OM.SoundID.spell2,
        UIApplication.OM.SoundID.suspence2,
        UIApplication.OM.SoundID.telegraph2,
        UIApplication.OM.SoundID.tiptoes2,
        UIApplication.OM.SoundID.typewriters2,
        UIApplication.OM.SoundID.update2,
        UIApplication.OM.SoundID.ringerVibeChanged,
        UIApplication.OM.SoundID.silentVibeChanged,
        UIApplication.OM.SoundID.vibrate
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
        
        UIApplication.OM.playSystemSound(soundID: dataSource[(indexPath as NSIndexPath).row])
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
