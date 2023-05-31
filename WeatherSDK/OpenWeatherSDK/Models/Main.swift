//
//  Main.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct Main : Codable {
    
    /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
    public let temp : Double?
    
    /// Temperature. This temperature parameter accounts for the human perception of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
    public let feelsLike : Double?
    
    /// Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
    public let pressure : Int?
    
    /// Humidity, %
    public let humidity : Int?
    
    /// Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
    public let tempMin : Double?

    /// Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
    public let tempMax : Double?

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}
