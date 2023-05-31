//
//  WeatherForecast.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct WeatherForecast : Codable {
    
    /// Internal parameter
    public let cod : String?
    
    /// Internal parameter
    public let message : Int?
    
    /// A number of timestamps returned in the API response
    public let cnt : Int?
    
    // List of Weather Data
    public let list : [WeatherData]?
    
    // City detail
    public let city : City?
    
}
