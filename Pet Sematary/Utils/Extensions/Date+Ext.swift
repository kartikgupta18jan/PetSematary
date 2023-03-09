//
//  UIView+Ext.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 05/03/23.
//

import UIKit

extension Date{
    func CheckTime(settingTime:String)->Bool{
        let pattern = "^[A-Z]-[A-Z]\\s{1}(\\d{1,2}:\\d{2})\\s{1}-\\s{1}(\\d{1,2}:\\d{2})$"
        let regex = try! NSRegularExpression(pattern: pattern)
        
        var startTime:Int = 0
        var endTime:Int = 0
        if let match = regex.matches(in: settingTime, range: .init(settingTime.startIndex..., in: settingTime)).first,
            match.numberOfRanges == 3 {
                let startRange = match.range(at: 1)
                startTime = Int(settingTime[Range(startRange, in: settingTime)!]) ?? 0
                let endRange = match.range(at: 2)
                endTime = Int(settingTime[Range(endRange, in: settingTime)!]) ?? 0
        }
        
        var timeExist:Bool
        let calendar = Calendar.current
        let startTimeComponent = DateComponents(calendar: calendar, hour:startTime)
        let endTimeComponent   = DateComponents(calendar: calendar, hour: endTime, minute: 00)
        
        let startOfToday = calendar.startOfDay(for: self)
        let startDateTime    = calendar.date(byAdding: startTimeComponent, to: startOfToday)!
        let endDateTime      = calendar.date(byAdding: endTimeComponent, to: startOfToday)!
        
        let calendarWeekend = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        if startDateTime <= self && self <= endDateTime && !calendarWeekend.isDateInWeekend(self){
            print("between 9 AM and 6:00 PM")
            timeExist = true
        }else {
            print("not between 9 AM and 6:00 PM")
            timeExist = false
        }
        return timeExist
    }
}
