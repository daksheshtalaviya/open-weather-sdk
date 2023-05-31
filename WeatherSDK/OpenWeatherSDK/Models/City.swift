//
//  City.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct City : Codable {
    
    /// City ID. Please note that built-in geocoder functionality has been deprecated. [Learn more](https://openweathermap.org/current#builtin).
    public let id : Int?
    
    /// City name. Please note that built-in geocoder functionality has been deprecated. [Learn more](https://openweathermap.org/current#builtin).
    public let name : String?
    
    /// Coordinate of the location
    public let coord : Coord?
    
    /// Country code (GB, JP etc.). Please note that built-in geocoder functionality has been deprecated. [Learn more](https://openweathermap.org/forecast5#builtin)
    public let country : String?
    
    /// City population
    public let population : Int?
    
    /// Shift in seconds from UTC
    public let timezone : Int?
    
    /// Sunrise time, unix, UTC
    public let sunrise : Int?
    
    /// Sunset time, unix, UTC
    public let sunset : Int?
    
}
