//
//  WeatherData.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct WeatherData : Codable {
    
    /// Coordinate of the location
    public let coord : Coord?
    
    /// Weather condition codes
    public let weather : [Weather]?
    
    /// Internal parameter
    public let base : String?
    
    /// Temperature information
    public let main : Main?
    
    /// Visibility, meter. The maximum value of the visibility is 10km
    public let visibility : Int?
    
    /// Wind information
    public let wind : Wind?
    
    /// Cloud information
    public let clouds : Clouds?
    
    /// Time of data calculation, unix, UTC
    public let dt : Int?
    
    /// System information
    public let sys : System?
    
    /// Shift in seconds from UTC
    public let timezone : Int?
    
    /// City ID. Please note that built-in geocoder functionality has been deprecated. [Learn more](https://openweathermap.org/current#builtin).
    public let id : Int?
    
    /// City name. Please note that built-in geocoder functionality has been deprecated. [Learn more](https://openweathermap.org/current#builtin).
    public let name : String?
    
    /// Internal parameter
    public let cod : Int?
    
    /// Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
    public let pop : Double?
    
    /// Time of data forecasted, ISO, UTC
    public let dtTxt : Date?
    
    enum CodingKeys: String, CodingKey {
        case coord, weather, base, main, visibility, wind, clouds, dt, sys, timezone, id, name, cod, pop
        case dtTxt = "dt_txt"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        coord = try? container.decodeIfPresent(Coord.self, forKey: .coord)
        weather = try? container.decodeIfPresent([Weather].self, forKey: .weather)
        base = try? container.decodeIfPresent(String.self, forKey: .base)
        main = try? container.decodeIfPresent(Main.self, forKey: .main)
        visibility = try? container.decodeIfPresent(Int.self, forKey: .visibility)
        wind = try? container.decodeIfPresent(Wind.self, forKey: .wind)
        clouds = try? container.decodeIfPresent(Clouds.self, forKey: .clouds)
        dt = try? container.decodeIfPresent(Int.self, forKey: .dt)
        sys = try? container.decodeIfPresent(System.self, forKey: .sys)
        timezone = try? container.decodeIfPresent(Int.self, forKey: .timezone)
        id = try? container.decodeIfPresent(Int.self, forKey: .id)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        cod = try? container.decodeIfPresent(Int.self, forKey: .cod)
        pop = try? container.decodeIfPresent(Double.self, forKey: .pop)
        
        if let dayString = try? container.decode(String.self, forKey: .dtTxt) {
            dtTxt = DateFormatter.weatherDateFormat.date(from: dayString)
        } else {
            dtTxt = nil
        }
        
    }
}
