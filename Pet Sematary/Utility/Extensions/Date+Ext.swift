//
//  UIView+Ext.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 05/03/23.
//

import UIKit

extension Date{
    func CheckTime()->Bool{
        var timeExist:Bool
        let calendar = Calendar.current
        let startTimeComponent = DateComponents(calendar: calendar, hour:9)
        let endTimeComponent   = DateComponents(calendar: calendar, hour: 18, minute: 00)
        
        let startOfToday = calendar.startOfDay(for: self)
        let startTime    = calendar.date(byAdding: startTimeComponent, to: startOfToday)!
        let endTime      = calendar.date(byAdding: endTimeComponent, to: startOfToday)!
        
        let calendarWeekend = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        if startTime <= self && self <= endTime && !calendarWeekend.isDateInWeekend(self){
            print("between 9 AM and 6:00 PM")
            timeExist = true
        }else {
            print("not between 9 AM and 6:00 PM")
            timeExist = false
        }
        return timeExist
    }
}
