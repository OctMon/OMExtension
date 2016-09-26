//
//  OMDatet.swift
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

public struct OMDateInfo {
    
    /// Year
    var year = 0
    /// Month of the year
    var month = 0
    /// Day of the month
    var day = 0
    
    /// Day of the week
    var weekday = 0
    
    /// Hour of the day
    var hour = 0
    /// Minute of the hour
    var minute = 0
    /// Second of the minute
    var second = 0
    /// Nanosecond of the second
    var nanosecond = 0
}

public extension Date {
    
    /**
     G: 公元时代，例如AD公元
     yy:年的后2位
     yyyy:完整年
     MM:月，显示为1-12
     MMM:月，显示为英文月份简写,如 Jan
     MMMM:月，显示为英文月份全称，如 Janualy
     dd:日，2位数表示，如02
     d:日，1-2位显示，如 2
     EEE:简写星期几，如Sun
     EEEE:全写星期几，如Sunday
     aa:上下午，AM/PM
     H:时，24小时制，0-23
     K：时，12小时制，0-11
     m:分，1-2位
     mm:分，2位
     s:秒，1-2位
     ss:秒，2位
     S:毫秒
     */
    func omFormatString(_ dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
    
    var omYearString: String {
        
        return omFormatString("yyyy")
    }
    
    var omMonthString: String {
        
        return omFormatString("MMMM")
    }
    
    var omWeekdayString: String {
        
        return omFormatString("EEEE")
    }
    
    func omDateInfo(_ timeZone: TimeZone = TimeZone.current) -> OMDateInfo {
        
        var calendar = Calendar.autoupdatingCurrent
        calendar.timeZone = timeZone
        
        return OMDateInfo(year: (calendar as NSCalendar).components(.year, from: self).year!, month: (calendar as NSCalendar).components(.month, from: self).month!, day: (calendar as NSCalendar).components(.day, from: self).day!, weekday: (calendar as NSCalendar).components(.weekdayOrdinal, from: self).weekdayOrdinal!, hour: (calendar as NSCalendar).components(.hour, from: self).hour!, minute: (calendar as NSCalendar).components(.minute, from: self).minute!, second: (calendar as NSCalendar).components(.second, from: self).second!, nanosecond: (calendar as NSCalendar).components(.nanosecond, from: self).nanosecond!)
    }
    
    static func omWithTimeStamp(_ timeStamp: TimeInterval) -> Date {
        
        return Date(timeIntervalSince1970: timeStamp / 1000)
    }
}

public extension OMDateInfo {
    
    func omString(dateSeparator: String = "-", dateNormal: Bool = true, nanosecond: Bool = false) -> String {
        
        var description: String
        
        if dateNormal {
            
            description = String(format: "%04li%@%02li%@%02li %02li:%02li:%02li", self.year, dateSeparator, self.month, dateSeparator, self.day, self.hour, self.minute, self.second)
            
        } else {
            
            description = String(format: "%02li%@%02li%@%04li %02li:%02li:%02li", self.month, dateSeparator, self.day, dateSeparator, self.year, self.hour, self.minute, self.second)
        }
        
        if nanosecond {
            
            description += String(format: ":%03li", self.nanosecond / 1000000)
        }
        
        return description
    }
}
