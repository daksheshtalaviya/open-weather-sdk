//
//  Weather.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct Weather: Codable {
  
    /// Weather condition id
    public let id : Int?
    
    /// Group of weather parameters (Rain, Snow, Extreme etc.)
    public let main : String?
    
    /// Weather condition within the group. You can get the output in your language. [Learn more](https://openweathermap.org/current#multi)
    public let description : String?
    
    /// Weather icon id
    public let icon : String?

}
