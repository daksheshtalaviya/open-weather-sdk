//
//  Wind.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct Wind : Codable {
    
    /// Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
    public let speed : Double?
    
    /// Wind direction, degrees (meteorological)
    public let deg : Int?
    
    /// Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
    public let gust : Double?

}
