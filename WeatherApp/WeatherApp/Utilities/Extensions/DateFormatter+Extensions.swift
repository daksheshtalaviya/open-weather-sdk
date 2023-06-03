//
//  DateFormatter+Extensions.swift
//  WeatherApp
//
//  Created by Dksh on 28/05/23.
//

import Foundation

extension DateFormatter {
    
    static let weatherDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter
    }()
    
    static let fullDayWithTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter
    }()
}
