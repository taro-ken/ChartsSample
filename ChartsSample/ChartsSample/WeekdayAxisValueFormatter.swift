//
//  WeekdayAxisValueFormatter.swift
//  ChartsSample
//
//  Created by 木元健太郎 on 2021/12/18.
//

import Foundation
import Charts

class WeekdayAxisValueFormatter: NSObject {
    enum Weekday: Int, CustomStringConvertible {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
        
        var description: String {
            switch self {
            case .monday:
                return "Monday"
            case .tuesday:
                return "Tuesday"
            case .wednesday:
                return "Wednesday"
            case .thursday:
                return "Thursday"
            case .friday:
                return "Friday"
            case .saturday:
                return "Saturday"
            case .sunday:
                return "Sunday"
            }
        }
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        guard let weekday = Weekday(rawValue: Int(value))?.description.prefix(3) else { return "UNKNOWN" }
        return String(weekday)
    }
}
